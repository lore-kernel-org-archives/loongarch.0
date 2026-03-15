Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF651DDC35
	for <loongarch@lists.linux.dev>; Sun, 15 Mar 2026 08:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773561920; cv=none; b=fLpR5mAhaEQilbgqVvsmldaUJrIDOmyGTW/sMNZKf3nbMdyqBcD0g435iJ02nbGs/6mVwhWoQKv7dFImB/1kyBD/XfR/DGr8pRz2hIODwbPLitkydytfmO9Ys1f2aaEqq9bwxigIESShKRc0gHJAo55u6gBprEhW9EFnDMBX8iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773561920; c=relaxed/simple;
	bh=VMVForwe+gHO5PwN6l0SCdc4WN2qcCfs/uwTYd/9BG4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sMzXbyvafEr0fAb/aGhbnSL7RhSOh5+2+lXbZtrIDHxE+CGBT29ey0k6df10FZgemZDXHz23KDZ0KpU+zhNA2WOcgyyatq3FFqojf2EuQ53zw59T6bw69ef7JPkQk5GvCLdyQrzaaEBlbU/3f4kMOpB7sGC2KERBMT/GVVBq5z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kez4rLyg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kez4rLyg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB2DFC4AF09
	for <loongarch@lists.linux.dev>; Sun, 15 Mar 2026 08:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773561919;
	bh=VMVForwe+gHO5PwN6l0SCdc4WN2qcCfs/uwTYd/9BG4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Kez4rLygPm7D0RGsHiR1dco7r/0jb0whvpX9g6hxXUr9Gbqc0jX7qfBnvjhMJAQWm
	 vdD2QR3FmFR2E/Nby5t8xlKthwuXFMUzaC1ksHcBAuP0OThhUkSNc1kKuxbUxyh7wJ
	 L0afb5Dt9wxgdDDRGtHLuNItZNkzQy0QoIuAduyRAqpcQAyJHO98R3XTxWody4gN5w
	 RKDbPymu5AFxEIIUR4GixZfi6L8b5mCV9WQb6PPwswIisdE0hOjC7I9bEmNaPZGeRD
	 HGW9KK8hnotRkgfVUj7GXqvUPhGKyNQeXU8PRSghfMzvYC6yxcp3VLIYTqC3VPQ+D6
	 S3OzW23NciiGQ==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b941762394aso433268466b.1
        for <loongarch@lists.linux.dev>; Sun, 15 Mar 2026 01:05:19 -0700 (PDT)
X-Gm-Message-State: AOJu0YyA6YGOmrc8vqD1GW0mzP3q3XQqCBb+Qzv1IPH0NrINlguSsGBu
	v39V5SKiFiY8Oa8yZ8gwpwGhvIbSQRUegPWYVzaHn0qVZGqZJgrvhEDYRiOXSm0cYEctFTEgsAw
	ndhe8ZbAFycdlRcWggMpfFUaQJmuEJB4=
X-Received: by 2002:a17:907:7253:b0:b96:efe7:b064 with SMTP id
 a640c23a62f3a-b976519951dmr567797966b.41.1773561918134; Sun, 15 Mar 2026
 01:05:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260310065510.8189-1-yangtiezhu@loongson.cn> <20260310065510.8189-2-yangtiezhu@loongson.cn>
In-Reply-To: <20260310065510.8189-2-yangtiezhu@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 15 Mar 2026 16:05:12 +0800
X-Gmail-Original-Message-ID: <CAAhV-H76FjHEtaBditJAjcXEKMtM6nQB0V1CjEXXCeB09fkaWw@mail.gmail.com>
X-Gm-Features: AaiRm52uejQr3GnkpR7_F2J9ecNyLA0HcJZFo7pxd_uSy30kOhAyJORSkfIB-BA
Message-ID: <CAAhV-H76FjHEtaBditJAjcXEKMtM6nQB0V1CjEXXCeB09fkaWw@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] LoongArch: Give more information if memory access failed
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied with small modifications, thanks.

Huacai

On Tue, Mar 10, 2026 at 2:55=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> If memory access such as copy_{from, to}_kernel_nofault failed,
> the users do not know what happened, it is very useful to print
> the exception code for such cases. Furthermore, it is better to
> print the caller function to know where is the entry.
>
> Here are the low level call chains:
>
>   copy_from_kernel_nofault()
>     copy_from_kernel_nofault_loop()
>       __get_kernel_nofault()
>
>   copy_to_kernel_nofault()
>     copy_to_kernel_nofault_loop()
>       __put_kernel_nofault()
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/loongarch/include/asm/uaccess.h | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/arch/loongarch/include/asm/uaccess.h b/arch/loongarch/includ=
e/asm/uaccess.h
> index 4e259d490e45..4dacbb32854c 100644
> --- a/arch/loongarch/include/asm/uaccess.h
> +++ b/arch/loongarch/include/asm/uaccess.h
> @@ -253,8 +253,13 @@ do {                                                =
                       \
>                                                                         \
>         __get_kernel_common(*((type *)(dst)), sizeof(type),             \
>                             (__force type *)(src));                     \
> -       if (unlikely(__gu_err))                                         \
> +       if (unlikely(__gu_err)) {                                       \
> +               pr_info("%s: memory access failed, ecode is 0x%x\n",    \
> +                       __func__, read_csr_excode());                   \
> +               pr_info("%s: caller is %pS\n",                          \
> +                       __func__, __builtin_return_address(0));         \
>                 goto err_label;                                         \
> +       }                                                               \
>  } while (0)
>
>  #define __put_kernel_nofault(dst, src, type, err_label)                 =
       \
> @@ -264,8 +269,13 @@ do {                                                =
                       \
>                                                                         \
>         __pu_val =3D *(__force type *)(src);                             =
 \
>         __put_kernel_common(((type *)(dst)), sizeof(type));             \
> -       if (unlikely(__pu_err))                                         \
> +       if (unlikely(__pu_err)) {                                       \
> +               pr_info("%s: memory access failed, ecode is 0x%x\n",    \
> +                       __func__, read_csr_excode());                   \
> +               pr_info("%s: caller is %pS\n",                          \
> +                       __func__, __builtin_return_address(0));         \
>                 goto err_label;                                         \
> +       }                                                               \
>  } while (0)
>
>  extern unsigned long __copy_user(void *to, const void *from, __kernel_si=
ze_t n);
> --
> 2.42.0
>
