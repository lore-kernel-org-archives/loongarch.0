Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45191DA21
	for <loongarch@lists.linux.dev>; Wed, 28 Aug 2024 04:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724818295; cv=none; b=OegZr+sUK6qOtSLCpFoBC+DXm6L8mlhYa/1iOBInfLx5fk7smdC5ziWCCEFHpDcXDOFNjcQ4gplLjknF13OwkdQJ4a9vPv48++lWFNJeZrfXHbgSglZFDv8UkYGjfTULIsxy1Wvn+H23O5mYPZeotaqrOzj3gDrOJf6XsqtVYl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724818295; c=relaxed/simple;
	bh=japFMcG52izjGaEUWNNFucotq714Zsn7XDlXfoKLq4g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GxCeHGE344VSup2vyR45UXairAkx5ujVjfx6NA/Y4wzFdTLFUDCHSB1UX+3B61UIt4aAqWkiTOLQge/UtTwb9AB65ywloVLZn1JgO4nuPlETWqlpP4V8ghvTdpOw2/j67l11DOSxfNVdNCLoyf2yVYRHzH6uF1G9aNo86+v4Vls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aYaE6Nr6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aYaE6Nr6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63CA9C4FF66
	for <loongarch@lists.linux.dev>; Wed, 28 Aug 2024 04:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724818295;
	bh=japFMcG52izjGaEUWNNFucotq714Zsn7XDlXfoKLq4g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aYaE6Nr64nJUQEH/lN4ndSLcCRU24BkoajMgPefxNoWgyfdSGo/bMrNpGp2agNtXm
	 oJAxUQxMQc6Omx3VEeCgaWdyDyky2D8lz0iZ4AkYpzCzTk1pS58NSI0WztAFkV4QHt
	 2sJcJoYOTcpBIAjkQDxIaWtWcyvOTOs7092YZA/nunWdQjB15EhcG2235kSYqqEUO0
	 fCRwxZSBTvUPk9Br9J+9b6OHwgiki5SKMCzt8rQseuFt+N4eDymDe8ANKmkMkz0PW4
	 Te9Grtag59yddlVIZ04OQDQxZcNY0vi9WDaJwDzGV3sm2kebnyKr+jfnWksALJpQur
	 es5J/4CnOkNug==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2f50966c448so37757731fa.2
        for <loongarch@lists.linux.dev>; Tue, 27 Aug 2024 21:11:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWnYTxXrPSCku+1F3omBIYTyi1J58CkvqzSrVvjjEXR6HDU4kPodSKaqw+0FVZDVMSoFU6f6Rb4VKc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7wRGPodH3dVklqvl8vGzmP6PLuWw3L59GbrL04HF+lx6wHuAx
	xZSt6IaQJUq4+yATGo/iu8rm0vx3Ies6mV9btoQhlsKefREgZqpqFVSFMQ+IF53qXwosFRFNpQH
	oSllBEexzwHVb2vyXn3mNK1Cobwg=
X-Google-Smtp-Source: AGHT+IF+9hk+eozCVHU/h/uBMwQyGJ3+UBBWkrtZDHcUYrQEZrkHcqWMLapujqJFsuZMFHUVAv5n6nRHNsThRKQG5GE=
X-Received: by 2002:a2e:be8b:0:b0:2ef:296d:1dd5 with SMTP id
 38308e7fff4ca-2f549f6759emr4413951fa.0.1724818293723; Tue, 27 Aug 2024
 21:11:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240828031421.147944-2-xry111@xry111.site>
In-Reply-To: <20240828031421.147944-2-xry111@xry111.site>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 28 Aug 2024 12:11:21 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5dDkyd5qkipwbKJvNduWM0UgENBqMHJGXhEoekizneaw@mail.gmail.com>
Message-ID: <CAAhV-H5dDkyd5qkipwbKJvNduWM0UgENBqMHJGXhEoekizneaw@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Remove posix_types.h include from sigcontext.h
To: Xi Ruoyao <xry111@xry111.site>
Cc: WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Ruoyao,

Just some questions:
1, Changing UAPI is not a good idea.
2. In another thread you said that "paper over" is not enough for some case=
s.
3. include/uapi/linux/types.h still include linux/posix_types.h, why
your "paper over" works?

Huacai

On Wed, Aug 28, 2024 at 11:14=E2=80=AFAM Xi Ruoyao <xry111@xry111.site> wro=
te:
>
> Nothing in sigcontext.h seems to require anything from
> linux/posix_types.h.  This include seems a MIPS relic originated from
> an error in Linux 2.6.11-rc2 (in 2005).
>
> The unneeded include was found debugging some vDSO self test build
> failure (it's not the root cause though).
>
> Link: https://lore.kernel.org/linux-mips/20240828030413.143930-2-xry111@x=
ry111.site/
> Link: https://lore.kernel.org/loongarch/0b540679ec8cfccec75aeb3463810924f=
6ff71e6.camel@xry111.site/
> Signed-off-by: Xi Ruoyao <xry111@xry111.site>
> ---
>  arch/loongarch/include/uapi/asm/sigcontext.h | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/loongarch/include/uapi/asm/sigcontext.h b/arch/loongarc=
h/include/uapi/asm/sigcontext.h
> index 6c22f616b8f1..5cd121275bac 100644
> --- a/arch/loongarch/include/uapi/asm/sigcontext.h
> +++ b/arch/loongarch/include/uapi/asm/sigcontext.h
> @@ -9,7 +9,6 @@
>  #define _UAPI_ASM_SIGCONTEXT_H
>
>  #include <linux/types.h>
> -#include <linux/posix_types.h>
>
>  /* FP context was used */
>  #define SC_USED_FP             (1 << 0)
> --
> 2.46.0
>
