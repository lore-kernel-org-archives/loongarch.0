Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C262F29
	for <loongarch@lists.linux.dev>; Tue, 14 Mar 2023 10:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1678788655;
	bh=W9skhsvXEGQ08C7gklvlc3PjcG4M+gp62gDeZRXjb6E=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=nGayq+lZCB/U9zaPu9LsWK93kFNf8NW8Z9MDjdYrRURLr72YFyigIXNUCWtW+ltO1
	 clJGtkh5KLqnhjAqsXJS5Dty2n2F5zkD9Dj6XNSW0ZPGqqxQO4+pE/2spQ15WtojCH
	 GJCacm6boFHGCOEeT8dK3uWyO8h6C/9RBnzeqG+I=
Received: from [192.168.124.9] (unknown [113.140.29.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384))
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 901BD65CBE;
	Tue, 14 Mar 2023 06:10:53 -0400 (EDT)
Message-ID: <109608ce770c2da249a7624f55666da640260f28.camel@xry111.site>
Subject: Re: [PATCH] LoongArch: Make WriteCombine configurable for ioremap()
From: Xi Ruoyao <xry111@xry111.site>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, loongarch@lists.linux.dev, Xuefeng
 Li <lixuefeng@loongson.cn>, Guo Ren <guoren@kernel.org>, Xuerui Wang
 <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
Date: Tue, 14 Mar 2023 18:10:46 +0800
In-Reply-To: <CAAhV-H4TpQuq9sE2H=zbO8cvwn3Aer_pu1a-DU9L9OSR1bQX=g@mail.gmail.com>
References: <20230314085433.4078119-1-chenhuacai@loongson.cn>
	 <21f5aba50b7732b48d2610a5015186adf6bdfb38.camel@xry111.site>
	 <CAAhV-H4TpQuq9sE2H=zbO8cvwn3Aer_pu1a-DU9L9OSR1bQX=g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2023-03-14 at 18:02 +0800, Huacai Chen wrote:
> > Hmm, is it possible to make a PCI quirk so SUC/WUC will be decided
> > automatically from the vendor:device ID of the PCI root controller?
> > Then we don't need to rely on the user or distro maintainer to select a=
n
> > option.=C2=A0 I see there is already many architecture-dependant #if
> > directives in drivers/pci/quirks.c so I guess such a quirk is acceptabl=
e
> > in PCI tree...
> Not a good idea, pci quirks need too long a time to review, and we
> don't know when this issue can be fixed in hardware.

How about make a PCI fixup in arch/loongarch/pci/pci.c then?  I think we
just need to set a flag in the fixup, then check the flag in
ioremap_wc...

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
