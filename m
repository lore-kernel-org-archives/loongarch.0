Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EA02EC558
	for <loongarch@lists.linux.dev>; Mon,  3 Nov 2025 09:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762162734; cv=none; b=Sblf5ekyJxPa0ga7NcqsMo6ubLtuPKXB3GN+XFVqf0OpgIuNcoK/y83VPFKnlKmQhozt528C6dEmxup9n3E1izpUvYUnU11rxvQTTFrAioA2xq4x+zx/1+WroS+5HsVLtk3bm6Ux/QTfT8njZT5OYiziwpbwppY/lCgQ9Gtz8bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762162734; c=relaxed/simple;
	bh=Qg/JUvgY0LLUYsziDbqE3xIlxP8IbGZDhMGdOwPRBmk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AyAfgwFcHEmG9c0T2XlbkNRLETuMUgtgg2ctWu012qv592wmjdtilf2r0zXQ8OQ80QjHFCrP5ekilNZo7ldfxV5L4e9eLnOHHN8j5xCHGG9dOsTuNEOtcO7qIFd7IK0qqWb86GIMwBpsCA2tz7DELzqm019L20viy325pdy+Bc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FoCA0Xaw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FoCA0Xaw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67FF4C116B1
	for <loongarch@lists.linux.dev>; Mon,  3 Nov 2025 09:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762162734;
	bh=Qg/JUvgY0LLUYsziDbqE3xIlxP8IbGZDhMGdOwPRBmk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FoCA0Xawqnkb+cK5tyRZotOHi2p8COxmSwI8vCoa5zH0wAD1D99ip5oF7VkMyOM/x
	 ZnutMcwpV1XQluoFSw21SJyNOoRezEXKenHCjX1dn85GUneN94WqbP0yZb1Q0W4Vud
	 k8MWI3zJ1HimI26hEI57+VZny6MrS/jUOlL2Vja2AU5A5Tri9gnlFf/+KkAsPka/TU
	 WGK8IsnB90xeLfB9TFYFkOWFaHtnEqKHAUqqcd2q10QsH+yiDNF8kO/nNn7qmrTAYR
	 K9rXHunBIPRW0qrRs+szGtcPvi0VE4sVs7dXFxigDyh9wco4RupJOTiqKnapUGZC4m
	 3Wzod9M702wjA==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b403bb7843eso861390766b.3
        for <loongarch@lists.linux.dev>; Mon, 03 Nov 2025 01:38:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUlMai3jP+vP45mBTXUuTTz0t31GBj4bBVygczw/6neE3FU3YkWaGKn7sVmFY9p5GgZBnvEahylO6A=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyakt3P0/9LAncKP+fbsjoY2UgjbroSFU4GDMdXW76RId/xZ7RW
	vMq3VgjgNDFHHPVg0cIXP6jfD2g+gorj1IDBmAMJ6bKcx9sUMQyKxLEdN2Y0vQLMWinr/WdgqEi
	JGmxdN4Xz72CfT94lNTlqe3HMVBQP51Y=
X-Google-Smtp-Source: AGHT+IHmfbwV8SigsulQEclIF+uYRraAtxtLgnC6OMLSDrueeSQtQc5/AQms1ur9aqoeQqDin6uCdxopGa5JccnNJNI=
X-Received: by 2002:a17:906:730a:b0:b41:b0c4:e74c with SMTP id
 a640c23a62f3a-b70704b27d3mr1269826466b.33.1762162732992; Mon, 03 Nov 2025
 01:38:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251029-loongarch-uapi-ptrace-types-v1-1-5c84855a348d@weissschuh.net>
 <CAAhV-H4oDtOUB_CecFE2sPE-JSQNNWvFRmY8=ZdDOCdD8kdo7g@mail.gmail.com> <4f8402e5-2bfa-4ee3-9123-fac887ed866d@t-8ch.de>
In-Reply-To: <4f8402e5-2bfa-4ee3-9123-fac887ed866d@t-8ch.de>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 3 Nov 2025 17:38:49 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4c8_GdnCdHfX_bVQ+rrGRtNua1r2MR0n5rXgXfgte0Sw@mail.gmail.com>
X-Gm-Features: AWmQ_bnoO_7ITHowyNe-gRybiOvemM1vW7A-BDo-3He9XlFEega8Z9-57h814ao
Message-ID: <CAAhV-H4c8_GdnCdHfX_bVQ+rrGRtNua1r2MR0n5rXgXfgte0Sw@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: ptrace: Use UAPI types in UAPI header
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: WANG Xuerui <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 3, 2025 at 5:27=E2=80=AFPM Thomas Wei=C3=9Fschuh <linux@weisssc=
huh.net> wrote:
>
> Hi Huacai,
>
> On 2025-11-03 17:12:58+0800, Huacai Chen wrote:
> > On Wed, Oct 29, 2025 at 11:20=E2=80=AFPM Thomas Wei=C3=9Fschuh <linux@w=
eissschuh.net> wrote:
> > >
> > > The kernel UAPI headers already contain fixed-width integer types,
> > > there is no need to rely on libc types. There may not be a libc
> > > available or it may not provide <stdint.h>, like for example on nolib=
c.
> > >
> > > This also aligns the header with the rest of the LoongArch UAPI heade=
rs.
>
> > Thank you for your patch, but could you please tell me some history
> > and user guide about the three styles: u64, __u64 and unint64_t?
>
> uint64_t -> userspace type, should not be used within the kernel
>             can technically be used in UAPI it will be somewhat
>             nonstandard and introduce a dependency on libc with no
>             upsides.
But a simple grep shows there are many uses of uint64_t in the kernel
code, are they all wrong?

Huacai

>
> u64      -> kernel-internal type, used for regular kernel code
>             defined in include/linux/types.h
>
> __u64    -> UAPI type usable from both kernel and userspace code
>             defined in include/uapi/linux/types.
>
> As a note: When applying the patch I want to clarify the commit message
> a bit, as nolibc indeed has a stdint.h header. The real breakage comes
> from a validation step we perform which does not add the libc include
> directory to the include path.
>
>
> Thomas
