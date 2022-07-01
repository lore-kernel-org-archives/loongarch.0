Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A252E10E9
	for <loongarch@lists.linux.dev>; Fri,  1 Jul 2022 02:14:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 589FAC34115
	for <loongarch@lists.linux.dev>; Fri,  1 Jul 2022 02:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656641694;
	bh=bMut/wyHHpo/R5sSXdinQZ1l0kR4ExfPLWaDGJSjZps=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HNp8d2EOtjXYrMb+yDJGw7yA1yCohoPisfVh9EWG7d+AYEPTBZaFSBJ3ouyYlvFMF
	 NPQTQoZKa+XRk46LRIbzynvcy1fSeq7xOzVXAeciX/cJkBH7IQLkuyKKKSql4HAWq5
	 bMwHLX7YQ59SOe09JO7XSm+qOnqmeElpk/9W2+6GqcqViFRq7el6SBde/dqxkkg8ka
	 1BvdWJM5Bw8ydCynIsxP/LxBWVeyLUPFjub3u3l6BWkST1Tt1RbByPNjfm/b7hgU3k
	 3oCFEabVN0nofH9v5rkjJjAtwC6U0KXgIZY98tXXxDzCMnmKiIP+xZhwNGaitxjT9X
	 C6b7VklwMek5g==
Received: by mail-vs1-f48.google.com with SMTP id z66so1047622vsb.3
        for <loongarch@lists.linux.dev>; Thu, 30 Jun 2022 19:14:54 -0700 (PDT)
X-Gm-Message-State: AJIora+qXoBoUqlUjByFp0CLpgUX1AyyMng72Kl94Ttho8RJfSkY5H8x
	sVyRYk63inOEQw6ZsC+BrpMLbUET2SdeLiQrunk=
X-Google-Smtp-Source: AGRyM1veV92+SR1VoarFp1Mc2gT2KSc4YTTSDlSU/i6HuHwo70DZEGjt5K4Dv1aG9CYr20TrYpFu709Szxo1EQyl78s=
X-Received: by 2002:a67:7347:0:b0:354:3f46:21ec with SMTP id
 o68-20020a677347000000b003543f4621ecmr9918006vsc.70.1656641693371; Thu, 30
 Jun 2022 19:14:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <f83d6a9d-ec07-21d1-87e3-700475192694@roeck-us.net>
In-Reply-To: <f83d6a9d-ec07-21d1-87e3-700475192694@roeck-us.net>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 1 Jul 2022 10:14:41 +0800
X-Gmail-Original-Message-ID: <CAAhV-H41pxiYudNRYOYK8hndMA2Ki6VUXxSaqa27yME1mjWjgw@mail.gmail.com>
Message-ID: <CAAhV-H41pxiYudNRYOYK8hndMA2Ki6VUXxSaqa27yME1mjWjgw@mail.gmail.com>
Subject: Re: Building loongarch64 toolchain
To: Guenter Roeck <linux@roeck-us.net>, WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi, Xuerui,

On Thu, Jun 30, 2022 at 10:06 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> Hi,
>
> I have been trying to build a toolchain for loongarch64 using gcc 12.1.0 and
> binutils 2.38. Unfortunately, the resulting toolchain doesn't work for me.
> Tracking down the problem, it turns out that gcc passes -mabi=lp64d to the
> assembler, but the assembler only supports -mabi=lp64.
>
> Where can I find guidance on how to build a working toolchain ? Using the
> available toolchain binaries is not an option.
Could you please give some guidance?

Huacai
>
> Thanks,
> Guenter
>
