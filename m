Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B3D1917F1
	for <loongarch@lists.linux.dev>; Mon,  9 Mar 2026 13:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773063114; cv=none; b=Byjb5/GUOepVAiW3pm0SKWh1zsbD6GqDNa5LrPd1lwY/cqFA79yj64SVxbXBp07oMtx34dTAZDEI7b62uKGNlBoHvD0dIqREQwjf2ZXTfQejQ87NZgM/Bd8U4DBrXOZi8mQfbHPSlP6dbW0x7+V2qkX/c4CrAQ12+cthfty36b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773063114; c=relaxed/simple;
	bh=chGpSmu/QUMAx6qvJsIGqTkrxHOBlNJu++547U14VxE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Od65gqnKwv6XiZBsQ+1h6Q//0359mZxXhzHS/bTcc9PFPbvlxHlwvuZx0tAA9iirbRJ3/tJPPpesSVwGQ3RGh4osaPW562cUhlhKM/u0LA51K80ExLntqgQnu6EjXqSThNSEbJx1FFif/8oZ3kjKKXFLltsngOOvaZp/NawKzUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C3qJnswW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C3qJnswW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C613C2BCAF
	for <loongarch@lists.linux.dev>; Mon,  9 Mar 2026 13:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773063114;
	bh=chGpSmu/QUMAx6qvJsIGqTkrxHOBlNJu++547U14VxE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=C3qJnswWPOk/d3rLnekvqGH/Fpk+Sq2VS6K3P3dZQtYCN8A6XxXxLdansmhfdTPmF
	 5vBnbzm8r29mM+IV1nLWfuisYkkPJDoyYxx4gPYKL9GylF8mjmwhK1DxGWH5QlF5PO
	 B0GPwQUjYfRhBIy1jzOefPHpbe0IakucfGoIKXzZvBESii8UHVWQll/NWWnffJR1sy
	 U0XE4PXCsbhDlxk+Bgr9VSn01i7jKrrXBUqQerY3Cwt4CeUU+uV/czNJv90b+1Y0zY
	 UIUwDPXT389+EHUVfALdbEeabMlkvqSGyJswX8DFIZDdLMzu+/xV7Q/Fz+uyTfc4aV
	 ZGounL8dNRoOg==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-662b42ca100so3796a12.0
        for <loongarch@lists.linux.dev>; Mon, 09 Mar 2026 06:31:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXXJhXudEC8SyO1tvxAkhwmYsHo8oauA8bO4Fur7icthUmqo64giTpBTuAbHjXKk/q1rAonlh+fcvo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwS7aotV7EarZefrUYu8wAyC9hQQ88nwJBn2UDzWdDqMSCtcR0j
	GpCRYeQMJoVEX6DjBzxVLl3IPG/wJR/5P8zTfImDq3TxNKPO+wmPYf9oYKmB0O5vgy49RefaE6g
	VMDoDZy5pVPhso2oGCJfoyjBAakTN/m0=
X-Received: by 2002:a05:6402:144c:b0:65c:b21:2df4 with SMTP id
 4fb4d7f45d1cf-6619d45a17dmr6580142a12.6.1773063112558; Mon, 09 Mar 2026
 06:31:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260225-loongarch-scq-v1-1-47acc2e45ec2@linutronix.de> <20260309080529-64921486-31cf-4bf3-90a1-ed7459bb16c5@linutronix.de>
In-Reply-To: <20260309080529-64921486-31cf-4bf3-90a1-ed7459bb16c5@linutronix.de>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 9 Mar 2026 21:31:41 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6ymiABkRu7VQqX87Qx_4k4=VWnB-WrcMo+sB7piUOntQ@mail.gmail.com>
X-Gm-Features: AaiRm51yKODZEKLI63eTWhMli5PUntHoLbQt7PjzRIk0E1fFXCBzPLSagBdQFe4
Message-ID: <CAAhV-H6ymiABkRu7VQqX87Qx_4k4=VWnB-WrcMo+sB7piUOntQ@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Only use SC.Q when supported by the assembler
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: WANG Xuerui <kernel@xen0n.name>, George Guo <guodongtai@kylinos.cn>, 
	Hengqi Chen <hengqi.chen@gmail.com>, Xi Ruoyao <xry111@xry111.site>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 9, 2026 at 3:07=E2=80=AFPM Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> Hi LoongArch maintainers,
>
> On Wed, Feb 25, 2026 at 11:09:39AM +0100, Thomas Wei=C3=9Fschuh wrote:
> > The 128-bit atomic cmpxchg implementation uses the SC.Q instruction.
> > Older versions of GNU AS do not support that instruction, erroring out:
> >
> > ERROR:root:{standard input}: Assembler messages:
> > {standard input}:4831: Error: no match insn: sc.q     $t0,$t1,$r14
> > {standard input}:6407: Error: no match insn: sc.q     $t0,$t1,$r23
> > {standard input}:10856: Error: no match insn: sc.q    $t0,$t1,$r14
> > make[4]: *** [../scripts/Makefile.build:289: mm/slub.o] Error 1
> >
> > (Binutils 2.41)
> >
> > Test support for SC.Q in kconfig and disable the atomics if the
> > instruction is not available.
> >
> > Fixes: f0e4b1b6e295 ("LoongArch: Add 128-bit atomic cmpxchg support")
> > Closes: https://lore.kernel.org/lkml/20260216082834-edc51c46-7b7a-4295-=
8ea5-4d9a3ca2224f@linutronix.de/
> > Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
> > ---
> >  arch/loongarch/Kconfig               | 3 +++
> >  arch/loongarch/include/asm/cmpxchg.h | 5 +++++
> >  2 files changed, 8 insertions(+)
>
> (...)
>
> This is still broken in mainline. Any chance to get this patch to Linus?
Now queued for loongarch-fixes, sorry for the late response.

Huacai

>
>
> Thomas
>
