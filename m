Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434337603F
	for <loongarch@lists.linux.dev>; Mon,  4 Nov 2024 02:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730687052; cv=none; b=gPpLkPo95vVn6wLaQJ9l/+5njjVwdscI31bUDHPVR7kpbF6bLjqDyjB1NPxHDQBb8JAqEGxLLtYZ9NeLYWZ0lhzk1ci/qyA8SW+alN1isXrla9MEUa1P8eV4ZzqXmSUMaugxMu/kkQJoI+BYC1MnLWveXnUfaiTzcG5p0pJVohc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730687052; c=relaxed/simple;
	bh=I3dhF0x96cZQijUd84kMCiRMDMYW7wG4a8XWx5JVndI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WYvzClmyhiPZ/kcHbSWQnqCgHmgdLoirDCpPs4ufKUUG82mbSFB2oIar4h+dgVosUsPZkYzypzwfJb2ZfTH3xCD45GDuIe+0HJgmSZzgESiindpNTMlxr7hploquZdliBG351FHd+0dzX9y6GBTX+MqSASATUNkq6e+KujtV6TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mVuxDgSS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mVuxDgSS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7DECC4CED3
	for <loongarch@lists.linux.dev>; Mon,  4 Nov 2024 02:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730687051;
	bh=I3dhF0x96cZQijUd84kMCiRMDMYW7wG4a8XWx5JVndI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mVuxDgSSIAL/RMAEj3Sp6P5S+isZ8v0O7xkcThpOUu/SEVmWWxKI8A/Lwh/v6IDQe
	 wAKoEsUdcL/G/UYlGRVDpQm5/RUO+GTzb+s6QHMtrhAykFJE8cFwcp5eSfKEgCfPDI
	 F+7d/jtmRcLuRj408s2ix/3xqzVsuwCll0lBxsJKnPlk+G1nDRmyACNcUmwzcFhaW2
	 rJXFeUfIOHshZwpfENj+SsAUHIDGa//wUMCze7M+bvWeW1z8P94HCaJnSUWuXCJwjS
	 q0QsYKehHj4ymKEaSIxgSylqA5tqyXb0hRl4rVjZAja9mT/roME5MB69s1c/503Gp+
	 Ww74UaXzB70oA==
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3807dd08cfcso3219627f8f.1
        for <loongarch@lists.linux.dev>; Sun, 03 Nov 2024 18:24:11 -0800 (PST)
X-Gm-Message-State: AOJu0YwndwGPoQjQbnPgAWGorLYTj0mhE8sRnd+UlcbPvOhSftmNHrS8
	XFHb/0o4aF4AIIReifRZyvblVBpmBcxtLsQyJ+x2tDNIfKzVo6ntJDPoploNVwNWoFyCaD/2Zwc
	BnNeGB5GFIhPqno+bIpQOKNsVLNg=
X-Google-Smtp-Source: AGHT+IFJL5udU3JG5ezqtrAgL4b8TH+QFRvhmsTzwBu5lXNxJYYXjU6z+/YJZGy7S28J/hr1MDHNN3EA1VnxtFfuk/E=
X-Received: by 2002:a05:6000:2ce:b0:37d:52fc:edf9 with SMTP id
 ffacd0b85a97d-381c7a5cf91mr11046198f8f.20.1730687050319; Sun, 03 Nov 2024
 18:24:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241103224752.190742-1-ebiggers@kernel.org>
In-Reply-To: <20241103224752.190742-1-ebiggers@kernel.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 4 Nov 2024 10:23:59 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5KaXBr-TdpDbJwcr_L0_mbSw=4J30uwQ2xn2YDs=Hg2Q@mail.gmail.com>
Message-ID: <CAAhV-H5KaXBr-TdpDbJwcr_L0_mbSw=4J30uwQ2xn2YDs=Hg2Q@mail.gmail.com>
Subject: Re: [PATCH] loongarch/crc32: add missing dependency on 64BIT
To: Eric Biggers <ebiggers@kernel.org>
Cc: loongarch@lists.linux.dev, Min Zhou <zhoumin@loongson.cn>, 
	Huacai Chen <chenhuacai@loongson.cn>, WangYuli <wangyuli@uniontech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Eric and Yuli,

On Mon, Nov 4, 2024 at 6:49=E2=80=AFAM Eric Biggers <ebiggers@kernel.org> w=
rote:
>
> From: Eric Biggers <ebiggers@google.com>
>
> The LoongArch CRC32 instructions are only specified for LA64 (64-bit)
> and cannot be assembled in 32-bit mode.  Therefore only build the
> LoongArch-optimized CRC32 functions when CONFIG_64BIT.
I think there are no build errors, just that it technically depends on 64BI=
T?

If so, there are a bunch of config options need to depend on 64BIT,
such as ARCH_HAS_PTE_DEVMAP, ARCH_SUPPORTS_HUGETLBFS,
HAVE_ARCH_TRANSPARENT_HUGEPAGE, HAVE_ARCH_KASAN, etc.

However, the dependencies exist at first, but then removed from Arnd's
suggestion. Because we have no 32BIT support now, so just keep it as
simple as possible.

This patch can be applied when we add 32BIT support, but not now.


Huacai

>
> Fixes: 2f1648220214 ("LoongArch: crypto: Add crc32 and crc32c hw accelera=
tion")
> Reported-by: WangYuli <wangyuli@uniontech.com>
> Closes: https://lore.kernel.org/r/DA8BCDFFEACDA1C6+20241103133655.217375-=
1-wangyuli@uniontech.com
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  arch/loongarch/crypto/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/loongarch/crypto/Kconfig b/arch/loongarch/crypto/Kconfi=
g
> index 200a6e8b43b1..b68b9a797f83 100644
> --- a/arch/loongarch/crypto/Kconfig
> +++ b/arch/loongarch/crypto/Kconfig
> @@ -2,10 +2,11 @@
>
>  menu "Accelerated Cryptographic Algorithms for CPU (loongarch)"
>
>  config CRYPTO_CRC32_LOONGARCH
>         tristate "CRC32c and CRC32"
> +       depends on 64BIT
>         select CRC32
>         select CRYPTO_HASH
>         help
>           CRC32c and CRC32 CRC algorithms
>
>
> base-commit: 886b7e80ab19841f640cafd8b5ab053409b9b931
> --
> 2.47.0
>
>
