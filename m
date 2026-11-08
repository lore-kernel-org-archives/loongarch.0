Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794121423;
	b=3yUZmjSB9IpXhw82I9e9VrcSv51bLd49f2fz/S8+4SL5TGtrViUYdox6CskdXcGYe3XJ
	 iJXK8+A8W2lKL/6kJOqKzLEte4uKXAdCyCMLyr4IOr3suSK7SqkVq8xQNVdzS8myOSHVj
	 5fXzXFa/qjkT63CFTsv1+BpLo4p0Jr2S93dWZg02eiFxOhdEyPc2QPRzySZijt0ySf8ne
	 19ThAf8Jd0xdKL6iQPr7KNHUIJqIGdNFJywFNFr559Enel4zojKKWpaB9Cgd8+vtWKbtB
	 iNd1+kxouZRHHJOi1SC964JBAmF5n6neia5kPJ1maDben90m53YP1BFNlZ+O5ChsbyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794121423;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=PqCraRvsBkJjRXkU4N7Ds+WrstGBtwW2/wRIicmkLGg=;
	b=BFN0xBR+2r+HFWuHGZ6j1XRyEaIA7m9uep+NpOllfGVXv5XPcCueE4ZuJQywgGrHkHBz
	 x5IMYln4CDKiK4Oxb1AYeOHJ6gVPblxaYo7CXg2w/wsNrOD/ttziJDLf7oJ9phpREUia4
	 5FpQJnpLPulc7nvjEppqq6UcnWpRsvcwXQynTdXFjA6zJnZQcZPNg5CGn+WvuiMtxTZdj
	 LM4jdmCkhHILOFrCsa4EfwfRBfZCu89zZP1g2nmIAfnjCzie0bTWuWt2SsXN2gMiZlHVo
	 V+gulM8mq919g2qwtEvggHhCpNBFQjolYKeY2rnr7x3NwHGoqxruWLBv65B8+rYL/BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	arc=none smtp.remote-ip=109.224.244.25
Received: from mail-24425.protonmail.ch (mail-24425.protonmail.ch [109.224.244.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06446606A31A
	for <loongarch@lists.linux.dev>; Sun,  8 Nov 2026 07:03:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06446606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=zf5wghusr5e5xbw23powvy4lpi.protonmail2; t=1794121418;
	x=1794380618; bh=PqCraRvsBkJjRXkU4N7Ds+WrstGBtwW2/wRIicmkLGg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=vqlX1b9vNU5TWIYAJZ2WZAZMVGyZGJEEKcFtlZVuybiCXwIaX2PbLo6SbWpJ38GqQ
	 r5km4Y69FDqmYWPr+veJHm4mJIEwtve2K9GHUSjcL0gXDVfj9Su6UjNPnJhb77tS78
	 Y3boTgrUDfVgVCPpQVtw7Qp63Jf4eButM9Vyxy+gTSsI6x6XUXNyxcGNf3VNmTtADm
	 DWIuu3AJhjm15FQyVQovY3noJYuVDSPezvlKIOxDnALr2mX2nOaTCgrJlIHjSXvY1N
	 R3OoSUAh2dpqboSFOh2WW7c6/wh7Q57u7hW4kD+XTJdhTjVdnXFG8aiZ7CFrJXHpOy
	 oFPBX7FacjA+w==
Date: Sun, 08 Nov 2026 07:03:33 +0000
To: Vincent Li <vincent.mc.li@gmail.com>
From: soffialanotte <soffialanotte@proton.me>
Cc: "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>
Subject: Re: How can I get started with loongson?
Message-ID: <fSJxsbJsW39TYhfbAbDhnY1GO08lZNNqS7U7G7050XxmFGBMtyULBoBOeWhOEjcm67O4H5Qq9ryDu0OvRk_Ao3XBInS6T9WtYa0NdWvwEWY=@proton.me>
In-Reply-To: <238b4f71-81ed-81b5-1bf0-5ad5773b5846@gmail.com>
References: <nIF7OzD8u33FHJ3qE1qFaK7jIfY6eOxk3R7imk_36Akc-o0DTFbXgpOe0Svpcw0Mi_Usx8t_WXLc8j3VjwJCVbLeXmCba5YxdiNsk7dkHWI=@proton.me> <238b4f71-81ed-81b5-1bf0-5ad5773b5846@gmail.com>
Feedback-ID: 192581689:user:proton
X-Pm-Message-ID: 968a157c1a6b955cfb572faf6ed5fcd8784f157a
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thursday, October 22nd, 2026 at 9:06 AM, Vincent Li <vincent.mc.li@gmail=
.com> wrote:
> On Wed, 21 Oct 2026, soffialanotte wrote:
>=20
> > Hi, everyone.
> >
> > This is a quick question. It may be inappropriate, and apologies
> > for remaining anonymous.
> >
> > I just became an employee of the loongson for a while. My business
> > unit is not related to upstream Linux directly. Before joining the
> > company, I had been a Linux amateur who contributed to the upstream
> > for other platforms. Since I can access to the loongson hardwares
> > easily now, may I ask how can I get started with loongson upstream?
> > Open documents, schematic diagrams, datasheets, web pages accessbile
> > only internally, etc. All of them are welcome.
> >
> > With best regards,
> > An anonymous
> >
> Hi "An anonymous",
>=20
> Welcome aboard (to Loongson and to the list)! Great to hear you've
> contributed upstream before =E2=80=94 that experience will serve you well=
 here.
>=20
> On getting started: the usual paths apply =E2=80=94 watch the list for pa=
tches
> touching LoongArch, grab a board, try booting mainline on it, and fix
> whatever breaks. For docs and schematics, the internal channels are the
> right place to ask; folks on this list can point you to the public ones
> (kernel docs, the LoongArch wiki, device tree bindings) but the
> internal-only material has to go through your company's own process. That
> part is a conversation for your BU, not this list.
>=20

Sorry for my late reply. Thank you, Vincent. What I meant was not
getting the detailed material from the mail list, it can be loongeco
or other sites, where I can use my internal identity to access
something, but the sites themselves are legal to talk about publicly,
since the information in my BU is not well documented, I cannot find
the useful material. For now, I have not asked my line manager for
the material, because I do not want my manager to think that I am
occupied with these things instead of my work. That is also the reason
why I use a new mail to remain anonymous. But I will use my real name
when I submit the patches. Thanks again!

--
With best regards,
An anonymous

> One small thing, though =E2=80=94 and I say this with a smile: Linux upst=
ream has
> a strict "no anonymous contributors" policy. The Signed-off-by: tag is a
> legal statement (see Documentation/process/submitting-patches.rst), and i=
t
> requires a real name and a real email. So if you want to contribute to
> upstream =E2=80=94 and we hope you do =E2=80=94 you'll need to introduce =
yourself
> properly, both here and in your patches. Anonymity is fine for asking
> questions on some forums, but it doesn't survive contact with git
> send-email.
>=20
> Looking forward to seeing your first patch (with a real name attached!).
>=20
> Best regards,
> Vincent
