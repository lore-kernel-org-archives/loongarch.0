Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCB61108
	for <loongarch@lists.linux.dev>; Mon, 16 Jan 2023 05:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1673847696;
	bh=rEd5LJal0k18Z47RyzG7yfXliLKWwpAHYhS56ZWoUe4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=W39RRFLrV0CslCMgWrHHxG3sW/TZBG215J1jo1nhqCpEqKh11pTqn2Hxr4Y9ICy+5
	 TLPHJkH+03+dXFjt/6C2EcOt9t/5cgac9r+OA6bUqXAzh8NiMoEJB0vgpYgaWki+S8
	 wxIZo9+P6SpF+o1QE5vi7zH7/YsZm25F3KP7nuRI=
Received: from [IPv6:240e:358:116a:de00:dc73:854d:832e:2] (unknown [IPv6:240e:358:116a:de00:dc73:854d:832e:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 1F93166753;
	Mon, 16 Jan 2023 00:41:29 -0500 (EST)
Message-ID: <972e4d0c69dea4e9659eb9459072b2b7b2fd963b.camel@xry111.site>
Subject: Re: [PATCH 1/4] LoongArch: Use trampoline for exception handlers
 and kill la.abs
From: Xi Ruoyao <xry111@xry111.site>
To: Huacai Chen <chenhuacai@kernel.org>, Jinyang He <hejinyang@loongson.cn>
Cc: Youling Tang <tangyouling@loongson.cn>, Xuerui Wang <kernel@xen0n.name>,
  loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Mon, 16 Jan 2023 13:41:17 +0800
In-Reply-To: <CAAhV-H55Kj4gMnORHfQUYJ3KBueLv7j+ktkNP9cE-=32nEShzg@mail.gmail.com>
References: <1673255274-18238-1-git-send-email-tangyouling@loongson.cn>
	 <1673255274-18238-2-git-send-email-tangyouling@loongson.cn>
	 <6f1a1f3c-4569-c427-76ae-2f7093cb5e9f@loongson.cn>
	 <CAAhV-H55Kj4gMnORHfQUYJ3KBueLv7j+ktkNP9cE-=32nEShzg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Mon, 2023-01-16 at 09:30 +0800, Huacai Chen wrote:
> On Sat, Jan 14, 2023 at 2:38 PM Jinyang He <hejinyang@loongson.cn>
> wrote:
> >=20
> > Hi, Ruoyao and Youling,
> >=20
> > I care about the performance when NUMA enabled. We set CSR.EENTRY
> > for each possible cpus where is NUMA-relative. So, I guess the more
> > codes in NUMA-relative memory makes more performance. If we just set
> > handler_trampoline as exception handler, the performance may be
> > influenced.
> So copying both the handlers and handler_trampoline can solve the
> problem? If that is possible, please do that on top of the latest code
> in
> https://github.com/loongson/linux/commits/loongarch-next

Hi folks,

I just wrote the trampoline code as a PoC to show "relocatable kernel
can work" and there must be some better way.  But I'm too sad to write
any serious code in this month, and I don't have access to a LoongArch
NUMA system.  So I think it's better to leave the job for you guys now
:).

Best regards

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
