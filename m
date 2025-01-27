Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26E85191F83
	for <loongarch@lists.linux.dev>; Mon, 27 Jan 2025 20:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738009675; cv=none; b=g3uysJJDqcJEHMKWJUWvrlT9Y6d7jvO4VmB8L8iom+15MlD2U0sjCRl+S5NDeEGh3JnOMPe4Y4zkkKc6U8ZwLeELbQrmb41dz2fF3MZNS3v83p1UzeEfhUWOw/v2+Uc53OD/0c4tahQzh/bPxji3/dOTxov3mDmpPSIE1LJ8fNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738009675; c=relaxed/simple;
	bh=6qm0LVCzPHindquTAdy3j2f3xu3MW5J4Jl1vh3Lt8vU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=XsdlMcOwZue/j4N1zKQB4OXtiXWG2WHzGIgdiaR5rLf8gze4rhAjmpHxs+hgpw6AOIeIzQUrP6Nj6iReHSGuCLtvQ8zR7cscYArxA4CxFoOwhVESWQRvLI10xylI2qAQHnTVfWWmmtyLFwOmEUmGyZKGbjG6Myfnn/gXS/Vn9Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 311C392009D; Mon, 27 Jan 2025 21:20:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 2A26392009C;
	Mon, 27 Jan 2025 20:20:56 +0000 (GMT)
Date: Mon, 27 Jan 2025 20:20:56 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Charlie Jenkins <charlie@rivosinc.com>
cc: Paul Walmsley <paul.walmsley@sifive.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Huacai Chen <chenhuacai@kernel.org>, 
    WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@linutronix.de>, 
    Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
    Alexandre Ghiti <alexghiti@rivosinc.com>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
Subject: Re: [PATCH 1/4] riscv: entry: Convert ret_from_fork() to C
In-Reply-To: <Z5aSMVZLMwmyCp9k@ghost>
Message-ID: <alpine.DEB.2.21.2501272017140.56843@angie.orcam.me.uk>
References: <20250122-riscv_optimize_entry-v1-0-4ee95559cfd0@rivosinc.com> <20250122-riscv_optimize_entry-v1-1-4ee95559cfd0@rivosinc.com> <alpine.DEB.2.21.2501252313210.27203@angie.orcam.me.uk> <Z5aSMVZLMwmyCp9k@ghost>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 26 Jan 2025, Charlie Jenkins wrote:

> >  Wouldn't it make sense to save a jump here and make it a tail call, i.e.:
> > 
> > 	la ra, ret_from_exception
> > 	tail ret_from_fork
> > 
> 
> I don't believe so due to the return address stack. It was shown in this
> patch [1] that a 7% performance improvement can be seen on existing
> riscv hardware by performing the extra jump. Doing tail calls should be
> avoided on riscv since the hardware can be expected to predict the
> return address incorrectly every time if the return address is manually
> changed.

 Fair enough, thanks.  Though no link to said patch given.

  Maciej
