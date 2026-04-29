Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E2137AA75
	for <loongarch@lists.linux.dev>; Wed, 29 Apr 2026 02:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777428816; cv=none; b=ZhaRwmBfSe8PfG2pBuWYTtQAYaG1hTlo6h1ucw41mGMdf/c/4DYxeUWuBvpB8B9SRd3+3caVfRuwtB0kV1xmBuWtZFW4TPz9Y6iYLo32V5nzTmp0+H5mhCZI0GTgxReRkZ99nwxrHzYADxvAjfQne0YBf47Yve8gsnsISayinjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777428816; c=relaxed/simple;
	bh=CZhZjA/V8YQXHozPRSRl9vZB3SD/37d7jA6HK8SoGBk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HJJptG0Xwxp8q1efGTOWxQ7JIA2ms9EwIdj6muRiJr2IhwYOsDR3bCLAF0kR9hfT9JMDjsBBkRNp/AoIwv7xRTyJ6qzjWdWIWpk19Fj/TirDkkJl53ZD89V6/O4V2RcOd0cYo98kFZDI4dvGRiiFg5wBm6iHjK19x0L+mSFnGHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=koUxL+2X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="koUxL+2X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E0FAC2BCF4
	for <loongarch@lists.linux.dev>; Wed, 29 Apr 2026 02:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777428815;
	bh=CZhZjA/V8YQXHozPRSRl9vZB3SD/37d7jA6HK8SoGBk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=koUxL+2X9LqzxRYuy85jPIHNw6xM8uzk8F6rZmFnwHzYhxk+2+3hJAzjDaPbPGTpC
	 O3LCCjf7Rj4TBL23OYk/CsJqePoO6XF0OhKHOEzp2EW6UlyLIaZQf3mPW52WVpbgoD
	 cDzqgqoy5ENsdZtyvOaj9K7W1RufTG1LXObuFjsQDJfrBRKoiLXKgjAgkbnqmZ8v3j
	 LKpehk/I0p5rN/ja/pKkOUl0s4jJaospNt/e9MmUO4QrIICUSaJFNLhEdM2BBLNFBr
	 KjGaIQ0cEKLX8PAPg1JtcTrmFZMFF6LOOkV3787sJDDxMQEbwGmMeEMAioeuocipzY
	 HZYvYTc5k2j+w==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6794b8699b8so4699105a12.1
        for <loongarch@lists.linux.dev>; Tue, 28 Apr 2026 19:13:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/8zKEniWt6jiqiedmHS5hH8FR1cLmjbMZ5jI6iYnRT1MxA5bxbKaA+QDu8WVCQ2a9rqjaYFsrgcyQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyd+mpxB0iAQ5TF/L1gi13Bu09ensAeVu8DNhGmNKnt/6r/4wXO
	SprXImiISx7Vh5j7eBFhFEQKyum2wwH7KG5gHYZMzDfYhrdHLYPC/3a6+B3ua890dKJ2wg8t3py
	obb7MqszOIcwu4q7guVC8dxrjmHKwyRg=
X-Received: by 2002:a17:907:3f98:b0:bb8:b525:cf18 with SMTP id
 a640c23a62f3a-bb8b525d1b1mr248834566b.30.1777428814033; Tue, 28 Apr 2026
 19:13:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260409121936.871418-1-xry111@xry111.site> <de142a5e34f9158500361e51d5a025bf3366699e.camel@xry111.site>
 <CAAhV-H4kxm-yfgxkxo+8NTvcRtz=uc8G0iTuKEbynkB6pMBSwQ@mail.gmail.com> <f71d329c66c873cf756623037d1e5806a9c94898.camel@xry111.site>
In-Reply-To: <f71d329c66c873cf756623037d1e5806a9c94898.camel@xry111.site>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 29 Apr 2026 10:13:22 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5z0EHrC5i_VvGBpX4v5tHVmkeHd8Z=zUMrKzvX0w3+4Q@mail.gmail.com>
X-Gm-Features: AVHnY4JJie16xkb0bTaIeGUOCgGQM96tBgmHr8Mn2KKPEMZ4RbhQLesqo-qbfZ4
Message-ID: <CAAhV-H5z0EHrC5i_VvGBpX4v5tHVmkeHd8Z=zUMrKzvX0w3+4Q@mail.gmail.com>
Subject: Re: Ping: [PATCH v2] LoongArch: detect and disable sc.q if erratic
To: Xi Ruoyao <xry111@xry111.site>
Cc: WANG Xuerui <kernel@xen0n.name>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	loongarch@lists.linux.dev, Zixing Liu <liushuyu@aosc.io>, 
	Mingcong Bai <jeffbai@aosc.io>, Arnd Bergmann <arnd@arndb.de>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	George Guo <dongtai.guo@linux.dev>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2026 at 11:49=E2=80=AFPM Xi Ruoyao <xry111@xry111.site> wro=
te:
>
> On Mon, 2026-04-27 at 16:43 +0800, Huacai Chen wrote:
> > Hi, Ruoyao,
> >
> > On Mon, Apr 27, 2026 at 10:17=E2=80=AFAM Xi Ruoyao <xry111@xry111.site>=
 wrote:
> > >
> > > Ping.
> > Can we keep this as an out-of-tree patch? It's a bit ugly and I think
> > the corrct way is update firmware.
>
> We can try harder urging the vendors to release the firmware update
> (there are other firmware bugs those the kernel cannot deal with anyway)
> but in many cases the users just complain "hey your distro doesn't boot"
> to the distro maintainers.  And some rogue ODM/OEM tend to ignore any
> reports relayed by the distro maintainers unless the distro pays some
> thousands of dollar.
I know, but distro kernels usually carry out-of-tree patches, this is
not the only one, right?

Huacai

>
> Thus IMO it's better to make the system at least bootable with a message
> (the pr_warn_once line in the patch) to clearly indicate the users that
> they need a firmware update, and the vendors may become motivated a
> little with more users complaining directly.
> >
>
> --
> Xi Ruoyao <xry111@xry111.site>
