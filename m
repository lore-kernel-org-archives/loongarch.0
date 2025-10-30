Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01216329E4C
	for <loongarch@lists.linux.dev>; Thu, 30 Oct 2025 20:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761855365; cv=none; b=Pn4oH7N3iUo78I9cVvPRQcHjnc0HSTK/tscKPXwz2ZSZgJPCFG3KVLFJQodVq9rM20a7jIjdwA3GoA7YrgqI0GFqlrASuGO6l14dd9aOVXuv6myULLwKJ1Y4lCxzmI6HIQQSMhCEQ8guTjoOH5JFn9XGgbJ+hzFzzAZG79094Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761855365; c=relaxed/simple;
	bh=BCTybeK7kbZPZoR7hVsfW499Ax65jB45Y6OolRAkkYY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=gLgR/Biy/gNhegwDyGN815WiMuZMFSOe0L8qDDO+mZX3m1ZExker+rbgIQClpc+bsp1M+wzXh2NRr9dJPJUSII/5nZlcJ6BjGnVHmsC9hF2GFHSgVRLwu9iutCo32PW+tujQ31E8d9JzJmEzevfG+7aOqNVz5myYEGauH/Gh8xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 6C88692009D; Thu, 30 Oct 2025 21:10:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 60ED392009C;
	Thu, 30 Oct 2025 20:10:17 +0000 (GMT)
Date: Thu, 30 Oct 2025 20:10:17 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Bjorn Helgaas <helgaas@kernel.org>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Thierry Reding <thierry.reding@gmail.com>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    "Rafael J. Wysocki" <rafael@kernel.org>, x86@kernel.org, 
    linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
    linux-mips@vger.kernel.org, loongarch@lists.linux.dev, 
    linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
    linux-pci@vger.kernel.org, linux-acpi@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/7] MIPS: PCI: Use contextual data instead of global
 variable
In-Reply-To: <20251030153121.GA1624982@bhelgaas>
Message-ID: <alpine.DEB.2.21.2510302003120.1185@angie.orcam.me.uk>
References: <20251030153121.GA1624982@bhelgaas>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 30 Oct 2025, Bjorn Helgaas wrote:

> It does complicate maintenance though.  I think all of mips ultimately
> uses register_pci_controller() and pcibios_scanbus().  Neither really
> contains anything mips-specific, so they duplicate a lot of the code
> in pci_host_probe().  Oh well, I guess that's part of the burden of
> supporting old platforms forever.

 FWIW new MIPS hardware continues being manufactured and if there is 
anything needed to clean up in generic MIPS/PCI platform code, then that 
can certainly be scheduled, subject to developers' resource availability.  
Individual MIPS platforms may vary of course, and with the solely legacy 
ones it will depend on the availability of hardware and engineers willing 
to maintain it.

  Maciej
