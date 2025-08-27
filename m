Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B726E31984E
	for <loongarch@lists.linux.dev>; Wed, 27 Aug 2025 07:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756280237; cv=none; b=RZzD7/BUxFSP9x3i1WcpzVE7gE4M5mc1xQlLps3WWQNDSiHs5Uhxb0fsuv6tDrPjbgFNMQLR0sL2jqx3DBMH/Yak46MByOjKd3BOhV4gEUD9CHvSRXV/9rTCauheE5NZiHhcxmJZS/Qi0FDUqbZxjEdJSKA7IT9MliDdd6gCp7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756280237; c=relaxed/simple;
	bh=Sh0yJk4cq763Z2S0AabEdm8SBSV2vslsylW6HkFUQaQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uqxdrMiBNLnZKSOjnSgC9AaeSBipmrgaJP1zyAtJDH8MhDsPZIr31RTZiVMMCtS+JGhT2VY6FA+hs+yzLn6cPW5FqdHQAjKr2aT82qx5hRM7OeHbsApKCtZVQO0TQ1id9o53il98s0Nh3/+buHynbqJRcxGP4EyJh6xSrPPRWus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QtxBPYu7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QtxBPYu7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38FF5C4CEEB
	for <loongarch@lists.linux.dev>; Wed, 27 Aug 2025 07:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756280237;
	bh=Sh0yJk4cq763Z2S0AabEdm8SBSV2vslsylW6HkFUQaQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QtxBPYu7fDtFycNHJZ2LlU0AUcE4nnO7Q69SU1yBU54GFd/bGX8OOEI0BoOyxD0Ok
	 isaGIW3gfkiXjKjb54VwDPd+us46jmMNnbFnVro2LXQidKaCeDfQOpqyVvsUdkVGL8
	 ZUwGmQt5f4w2fjhSUE9T9Efw7ywEIVA7ewDEOOu3AF2YOE1IbhvvbDATFSUeWm/FlB
	 X0aoJrPMhYaCJc0wXMp9sAjoI0Gss/q4uk/9uLGY7HBlg6sB77xJla0XZIJZVPqw3Q
	 BrLDCRnoN897a4UA/9pIzw1uiWnBoPg6c44KAOTWo06inXYPdILerPKwR765FVuudF
	 cnwetJuHMc7vQ==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-61c22dceb25so7909045a12.2
        for <loongarch@lists.linux.dev>; Wed, 27 Aug 2025 00:37:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUA2Dn57mCyHQ/u9UcUjM4XDlUlDhtY+fAVv6pEwak31tRr3pLQfS2zhBIAABF5AzVul0b1iIbUJK0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzsMLgMc+tW847Bzl2Mk1xDzQx+hcpt7yHz/GReU/pq95Mj/PWr
	bY28Gz34ul0gcXkXkhxQc6kbvm6G+gc84j5HCNO74WMyh6bSRx1WumbU9sXvzlHSAGVEOkWtkEo
	CDkh1cL5DnMtDu51ddxS+H7Ex6icAAL4=
X-Google-Smtp-Source: AGHT+IHmE5mRPrt9MQZ5SrGZ/Eh0fnCb6y74Ut+o4kT2Qo/McnYzAh+aX1nwaWNUnvryQLwksDNy0JK0iUscSWykyZo=
X-Received: by 2002:a05:6402:504e:b0:618:2257:7fcf with SMTP id
 4fb4d7f45d1cf-61c1b705748mr13883285a12.18.1756280235646; Wed, 27 Aug 2025
 00:37:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250826011722.82391-1-youling.tang@linux.dev> <20250826011722.82391-2-youling.tang@linux.dev>
In-Reply-To: <20250826011722.82391-2-youling.tang@linux.dev>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 27 Aug 2025 15:37:03 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7csV-vce6QGjFGd-R4JrLmbgoEs4UwKayKUxdgc3Ki=w@mail.gmail.com>
X-Gm-Features: Ac12FXwQWG9U9zLqW3Fy0iKKmm6IRWH5-eIBaw6-dIEfjnX1uwk4CAdRYKGbcgk
Message-ID: <CAAhV-H7csV-vce6QGjFGd-R4JrLmbgoEs4UwKayKUxdgc3Ki=w@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] LoongArch: Add struct loongarch_image_header for
 kernel image
To: Youling Tang <youling.tang@linux.dev>
Cc: WANG Xuerui <kernel@xen0n.name>, Baoquan He <bhe@redhat.com>, Yao Zi <ziyao@disroot.org>, 
	kexec@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Youling Tang <tangyouling@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Youling,

On Tue, Aug 26, 2025 at 9:18=E2=80=AFAM Youling Tang <youling.tang@linux.de=
v> wrote:
>
> From: Youling Tang <tangyouling@kylinos.cn>
>
> Define a dedicated image header structure for LoongArch architecture to
> standardize kernel loading in bootloaders (primarily for kexec_file).
>
> This header includes critical metadata such as PE signature, entry points=
,
> image size and load address offset, etc.
>
> Signed-off-by: Youling Tang <tangyouling@kylinos.cn>
> ---
>  arch/loongarch/include/asm/image.h | 40 ++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 arch/loongarch/include/asm/image.h
>
> diff --git a/arch/loongarch/include/asm/image.h b/arch/loongarch/include/=
asm/image.h
> new file mode 100644
> index 000000000000..1f090736e71d
> --- /dev/null
> +++ b/arch/loongarch/include/asm/image.h
> @@ -0,0 +1,40 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * LoongArch binary image header.
> + *
> + * Author: Youling Tang <tangyouling@kylinos.cn>
> + * Copyright (C) 2025 KylinSoft Corporation.
> + *
> + * Most code is derived from LoongArch port of kexec-tools
> + */
> +
> +#ifndef __ASM_IMAGE_H
> +#define __ASM_IMAGE_H
> +#ifndef __ASSEMBLY__

__ASSEMBLY__ is replaced by __ASSEMBLER__ now.

> +
> +/**
> + * struct loongarch_image_header
> + *
> + * @pe_sig: Optional PE format 'MZ' signature.
> + * @reserved_1: Reserved.
> + * @kernel_entry: Kernel image entry pointer.
> + * @image_size: An estimated size of the memory image size in LSB byte o=
rder.
> + * @text_offset: The image load offset in LSB byte order.
> + * @reserved_2: Reserved.
> + * @reserved_3: Reserved.
> + * @pe_header: Optional offset to a PE format header.
> + **/
> +
> +struct loongarch_image_header {
> +       uint8_t pe_sig[2];
Use dos_sig is better.

> +       uint16_t reserved_1[3];
Use padding_1[3] is better.

> +       uint64_t kernel_entry;
> +       uint64_t image_size;
Use kernel_asize to keep consistency with head.S.

> +       uint64_t text_offset;
> +       uint64_t reserved_2[3];
> +       uint32_t reserved_3;
Just use uint32_t reserved_2[7] here?


Huacai

> +       uint32_t pe_header;
> +};
> +
> +#endif /* __ASSEMBLY__ */
> +#endif /* __ASM_IMAGE_H */
> --
> 2.43.0
>
