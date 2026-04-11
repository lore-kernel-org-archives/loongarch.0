Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9251DD0EF
	for <loongarch@lists.linux.dev>; Sat, 11 Apr 2026 13:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775913171; cv=none; b=BGNV+3KMmrcQCDsoE3GR4BRONijw6eaTGY9lqcUIC2XUjWJN/nqztl+f4LPVHQy6IHSLhQrfylVXBvgqCC4B+0lh9jWUCHhhD29ipii8Q5HPjgipHBjhp5WjH6nkFaG4pA/MhDyHn9ozhA1i8NtQJwSE31ffjnYVKT/QnxMMLpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775913171; c=relaxed/simple;
	bh=caaSZwvctMQv/TLUmlatIUJSJoYOCJ+vv67M+DQoqlE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J7YhYR3l1okyVqDU7bG6q9vyWXB4xvfAOdI20/FQH4xrcnS/oHdniUhTfaUjGRlhlQotgyNzXDqPftlHuEHKRqj8jIb1vi1+m7nljqpGdwoYhgexP2uysHx2lymVkGl33YA3E1Mimds49GuZ5eBe0rjh0tP0DLcUS7YqoZgo5CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NztXxBtp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NztXxBtp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BCE8C2BCAF
	for <loongarch@lists.linux.dev>; Sat, 11 Apr 2026 13:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775913171;
	bh=caaSZwvctMQv/TLUmlatIUJSJoYOCJ+vv67M+DQoqlE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NztXxBtpeovX8CqxpVgXVpJk5ej+m7yC8bmW5ISVUfbqaRLXCDbMUlXu2bFSYP3Hq
	 CbWrBh0TsFEGt4agJsZvvwIn3UNfuUDk6wnA6w5iy0vHBWerFv5p5iGUmiKM3/2s62
	 tcN8dw1AbOnovH1SAcyTaKjTXEHiL1o+mExgAtHttryfKg+Xk5d37O5CPMNscBY/eV
	 nE4rymbJ+oamtg37054Q16Kjh5sHbwidCt/dRCqSdd7dozwY8Qk6IJMsKS+twKDeT+
	 3puSvuKwks1p5KWMAYwgRZvv9BW7ec6AbpcUVd9Ij4/fyUJ21BHnT8YVOouOyZ01OM
	 sm3sLUN0HeeMg==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-66fb5f2183fso5269681a12.3
        for <loongarch@lists.linux.dev>; Sat, 11 Apr 2026 06:12:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXX7WnAeH7Jaob/vDKWVr1dVcHxeC1xbNaIkU3/ByGuE7iijEOipRP/nTfYw17eUuhs7k7iP5Jldgs=@lists.linux.dev
X-Gm-Message-State: AOJu0YwaBuHkA1aRMPfCRUIq5LCm4GMBs0CBJS2e5JhwWbLsL5wyOpXZ
	liXQ1owvGz/hj6SbQiUpLpridi97muR29Ieb6pkj1LG1EdohuRDXe7PppKeiWvtiPtWR4246fwv
	nUZm7mT01u/26Gmly+pKD+UBey7/IhwA=
X-Received: by 2002:a17:907:a807:b0:b9d:6cec:23b9 with SMTP id
 a640c23a62f3a-b9d729c06ecmr394026166b.41.1775913170139; Sat, 11 Apr 2026
 06:12:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <599CB656808E9EE5+20260409073356.1476812-1-luoqiu@kylinsec.com.cn>
In-Reply-To: <599CB656808E9EE5+20260409073356.1476812-1-luoqiu@kylinsec.com.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 11 Apr 2026 21:12:38 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5SfXa3b--PMK8qfPkLxCbxNP_pkanwQrn6V-bqy8=o5Q@mail.gmail.com>
X-Gm-Features: AQROBzB6919qtiMWkHxsALWxzK7b_ZmrNoO0YgbxdPKd_butFt0lWcCx0MfM-nk
Message-ID: <CAAhV-H5SfXa3b--PMK8qfPkLxCbxNP_pkanwQrn6V-bqy8=o5Q@mail.gmail.com>
Subject: Re: [PATCH] loongarch: stackprotector: Use get_random_canary() for
 stack canary init
To: Luo Qiu <luoqiu@kylinsec.com.cn>
Cc: WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.

Huacai

On Thu, Apr 9, 2026 at 3:35=E2=80=AFPM Luo Qiu <luoqiu@kylinsec.com.cn> wro=
te:
>
> Replace the custom stack canary initialization with the
> get_random_canary() helper, following the pattern established in commit
> 622754e84b10 ("stackprotector: actually use get_random_canary()").
>
> Signed-off-by: Luo Qiu <luoqiu@kylinsec.com.cn>
> ---
>  arch/loongarch/include/asm/stackprotector.h | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
>
> diff --git a/arch/loongarch/include/asm/stackprotector.h b/arch/loongarch=
/include/asm/stackprotector.h
> index a1a965751a7b..42f6c3f69115 100644
> --- a/arch/loongarch/include/asm/stackprotector.h
> +++ b/arch/loongarch/include/asm/stackprotector.h
> @@ -12,9 +12,6 @@
>  #ifndef _ASM_STACKPROTECTOR_H
>  #define _ASM_STACKPROTECTOR_H
>
> -#include <linux/random.h>
> -#include <linux/version.h>
> -
>  extern unsigned long __stack_chk_guard;
>
>  /*
> @@ -25,11 +22,7 @@ extern unsigned long __stack_chk_guard;
>   */
>  static __always_inline void boot_init_stack_canary(void)
>  {
> -       unsigned long canary;
> -
> -       /* Try to get a semi random initial value. */
> -       get_random_bytes(&canary, sizeof(canary));
> -       canary ^=3D LINUX_VERSION_CODE;
> +       unsigned long canary =3D get_random_canary();
>
>         current->stack_canary =3D canary;
>         __stack_chk_guard =3D current->stack_canary;
> --
> 2.53.0
>
