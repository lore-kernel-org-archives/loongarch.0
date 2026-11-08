Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794114312;
	b=G21FbzTW1UADbMqUdfbX/tW9CQH0XnM03P0usV59r2O4a/otNdQecDKhRvNv/IGP4V+T
	 9CwZCnbTxHj4jPVWG6mbn2epSow7QXlRGg32E4/dK500Fdo8Ss/qi1v7sp2wsPR8wkBKy
	 OD5o4wVELvJ7m6ROAaYvk0gpU5Ccm+bdeDY5zCT5g4EWcvrSTuGCTLe0/6r2D2X7mRk/5
	 Ut4XionKd3zbLBSHsbpmqppm16EBBWCvG2COcqjBG4kKpPrapygq0/iUuBAFlQo73qLl7
	 2R6nMqTw3GXUiFJ5oUyJiRRB0QP+mfM7YsJKH9KOTW+v4/zhwjySZ2ai6a1eM6LGSeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794114312;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5u9pOhE33kqguxgR494dsEWXe7ZtrDvrnpyBZ7YKUoI=;
	b=Zc8uwD7gOfJlj61LHdDj9JXyV18ep8M5DlSPYdKPeTiubLY0TZWniBOdqRN2M4c+9Ok4
	 OVvNuFhM3xYa3+yePIM7Xv7zmEHCGkUSNQLzBua67ZUIWxkjkdHC6SVNAbL40/wpsFeQA
	 lq7+amwnwVnw9otUsvO8IbY+VTxcAVjn0m9OIH0tkVDbWKH8Tmdt7hWbm5/k2M0rm7dr+
	 Dp6tCxmHNaR0Ay+wQYTI1m0zON0kVv1wDz02JsbGFW0EfCt8BC7xuEjfGSLD/fg59tiMr
	 3eT363KXfzs+kIL/kkECl0Pcq0AwCG0uCfZbKrGWnTTZeue6vxMPKUx462NSc+kW8wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iFZLSoqu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E62B606A31A
	for <loongarch@lists.linux.dev>; Sun,  8 Nov 2026 05:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iFZLSoqu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E727D1F0089F
	for <loongarch@lists.linux.dev>; Sun,  8 Nov 2026 05:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794114311;
	bh=5u9pOhE33kqguxgR494dsEWXe7ZtrDvrnpyBZ7YKUoI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iFZLSoquJ0W57JxIvPD55bbGig5ks1bZAA4RlcAJzj2G6GdAdhS7SZ75gfISMKgER
	 DciMvfTXpRzM41eLoSY6Di/CNlTFdzW/TSSJm2qlAQTExiOW2dEY18gftzfFbDdCes
	 b0l+fHcqT67ciNUj5PsM35U/ZR4sKS8PjsZnrMlgp6/f068kXMvRxagbqJCObYbn9l
	 0O50duExq7T96HjO9h0CfNrUgeDLbY9jJEj/y4grY3zuG8XB6Hc8E8W1eVMd7i6jTf
	 b40lLYZO68mzSneuhYkD5Fj6o2pvJxnpARX0pL/ug0rgLo9GHZZCQuy/ZdA+TOmcTm
	 Iqu/uQrrvfogA==
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b587591414so160005a12.0
        for <loongarch@lists.linux.dev>; Sat, 07 Nov 2026 21:05:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF3UTtvBB8v3M6qX0mVczs4GN7v/kthcCWcgyO4AAXuTTmAue3eb6kOxv0qw1hEc6JvsmLZee3ZLhs=@lists.linux.dev
X-Gm-Message-State: APuU4Z/Bn5T3DGxvohqMUbS6RQO9z8qR7H2sORcJlgk0QJ6O7R48LANH
	JTIE8ZqDmPUyHztZTtHxcVyiSZKhmR75jGgJl943xFAVwLTrVzUQgc9/2vxChIzWD3KvJI0ecyk
	A2kwIGhxIKucg4PhntrhGrPhGooiKbuc=
X-Received: by 2002:a05:6402:4022:b0:6b4:16fb:b9bc with SMTP id
 4fb4d7f45d1cf-6b7224d5614mr349494a12.37.1794114310590; Sat, 07 Nov 2026
 21:05:10 -0800 (PST)
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261105125906.2284169-1-ruanjinjie@huawei.com>
In-Reply-To: <20261105125906.2284169-1-ruanjinjie@huawei.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 8 Nov 2026 13:04:59 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5jtQZs+cZAUiLTRt955yYiOx33TwsgoNs9bPNCDikMgg@mail.gmail.com>
X-Gm-Features: AclHuK-D4QHwaK4gbmoN3WrbT8MH-F2XcRC6F-4Ti5FNOEguflRxA54anPRIFws
Message-ID: <CAAhV-H5jtQZs+cZAUiLTRt955yYiOx33TwsgoNs9bPNCDikMgg@mail.gmail.com>
Subject: Re: [PATCH v8] LoongArch: kexec_file: Fix elf_headers memory leak in
 retry loop
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: kernel@xen0n.name, rppt@kernel.org, tangyouling@kylinos.cn, 
	baoquan.he@linux.dev, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.

Huacai

On Thu, Nov 5, 2026 at 8:59=E2=80=AFPM Jinjie Ruan <ruanjinjie@huawei.com> =
wrote:
>
> A retry allocates new elf headers and overwrites image->elf_headers,
> leaking the previous buffer.
>
> Free it before assigning.
>
> Cc: Huacai Chen <chenhuacai@kernel.org>
> Cc: WANG Xuerui <kernel@xen0n.name>
> Cc: Youling Tang <tangyouling@kylinos.cn>
> Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Cc: Sourabh Jain <sourabhjain@linux.ibm.com>
> Cc: Kees Cook <kees@kernel.org>
> Cc: stable@vger.kernel.org
> Link: https://sashiko.dev/#/patchset/20260729031235.2840255-1-ruanjinjie%=
40huawei.com
> Fixes: 55d990f0084c ("LoongArch: Add EFI binary support for kexec_file")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
> v7 -> v8:
> - Split out from the patch set as Mike suggested.
> - Link to v7: https://lore.kernel.org/all/20261026075201.699550-1-ruanjin=
jie@huawei.com/
> ---
>  arch/loongarch/kernel/machine_kexec_file.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/loongarch/kernel/machine_kexec_file.c b/arch/loongarch/=
kernel/machine_kexec_file.c
> index 5412aa9f3568..0fe60907b97f 100644
> --- a/arch/loongarch/kernel/machine_kexec_file.c
> +++ b/arch/loongarch/kernel/machine_kexec_file.c
> @@ -166,6 +166,10 @@ int load_other_segments(struct kimage *image,
>                         vfree(headers);
>                         goto out_err;
>                 }
> +
> +               if (unlikely(image->elf_headers))
> +                       vfree(image->elf_headers);
> +
>                 image->elf_headers =3D headers;
>                 image->elf_load_addr =3D kbuf.mem;
>                 image->elf_headers_sz =3D headers_sz;
> --
> 2.34.1
>
