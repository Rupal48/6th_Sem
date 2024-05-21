class Car :
    wheels = 4
    def __init__(self,company,model) :
        self.company = company
        self.model = model
    def changeCompany(self,company) :
        self.company = company
    def changeModel(self,model) :
        self.model = model
    def description(self):
        print(f"This is a {self.company} {self.model}")

c1 = Car("Maruti",800)
c2 = Car("Tata","Nano")
c1.description()
c1.changeModel(1600)
c1.description()
c2.description()