Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC6C39C
	for <loongarch@lists.linux.dev>; Thu, 14 Sep 2023 15:25:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 431BDC433C9
	for <loongarch@lists.linux.dev>; Thu, 14 Sep 2023 15:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694705134;
	bh=knWsHjBFVRzdgek7o198MSYRBmsXslhV9GmcwZLF6yE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=O3dJ2yRwd8ajZp73nuPqUbjPhXusPFVa5xTYPVePNAsdbvpw8dJ5Nwhw/1c+hCvNG
	 9D0E/UNKtrW45cljZ7CPmVpzp5fyJsxBYzQBMOF9hqggu7K3w1l6jAKB2ZidkO2aHS
	 Xlsn3nQwJynB93v44RjfHbK1Jh/v1SMdfWUG/mPWNX+L+Dc2K4Tdff0w6+RKr5NOGR
	 Ktuddgq7Nw0UFl+3QJ0xioQ3VWJPTy7lPXWki127Zc1Nb/GmCJfXIoUwdPkBvVC9+2
	 0X0h4/7MwLmRqSEAiRadXRUQfLLd1+4j2Cg7f4u/OFrxmQm3c+HXX3YSQIB6CV2qpY
	 fk118OZ2a9Cyg==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-52f33659d09so1295169a12.1
        for <loongarch@lists.linux.dev>; Thu, 14 Sep 2023 08:25:34 -0700 (PDT)
X-Gm-Message-State: AOJu0Yxx1pYHCyyRh5ztSlOoqoSvyB/1ZT4X6OwK4Rf4b+Z8Zwx8sIp3
	jm9pyodaV1VDktZfJEWiDTyDbLmsQbbO5yyRWXY=
X-Google-Smtp-Source: AGHT+IHcwA2t/kyZUwQVU13H6XxJZI4dOYLldBtDniM048IzFCaIZJz9M3iPj3Q/HXpAc+4DI080jVBRFLMV0s/WWvc=
X-Received: by 2002:aa7:c703:0:b0:52a:250e:a052 with SMTP id
 i3-20020aa7c703000000b0052a250ea052mr5581143edq.7.1694705132751; Thu, 14 Sep
 2023 08:25:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230914103445.511285-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230914103445.511285-1-andriy.shevchenko@linux.intel.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 14 Sep 2023 23:25:22 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6Q0sirFEDdc1v4BSfDY94eZvJazy0XLKM8V94GMJvQnQ@mail.gmail.com>
Message-ID: <CAAhV-H6Q0sirFEDdc1v4BSfDY94eZvJazy0XLKM8V94GMJvQnQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] LoongArch: Add missing headers
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	WANG Xuerui <kernel@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,  Andy,

Thank you for your patch, can this patch solve the problem below?
https://lore.kernel.org/oe-kbuild-all/202309072237.9zxMv4MZ-lkp@intel.com/T=
/#u

If yes, please add a reference in the commit message. I have
investigated this problem for a long time but failed to solve it.

Huacai

On Thu, Sep 14, 2023 at 6:34=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> The header uses definitions from sizes.h, include it.
> For __iomem we need the compiler_types.h, include it.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  arch/loongarch/include/asm/addrspace.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/loongarch/include/asm/addrspace.h b/arch/loongarch/incl=
ude/asm/addrspace.h
> index 5c9c03bdf915..eaf8ac098622 100644
> --- a/arch/loongarch/include/asm/addrspace.h
> +++ b/arch/loongarch/include/asm/addrspace.h
> @@ -10,7 +10,9 @@
>  #ifndef _ASM_ADDRSPACE_H
>  #define _ASM_ADDRSPACE_H
>
> +#include <linux/compiler_types.h>
>  #include <linux/const.h>
> +#include <linux/sizes.h>
>
>  #include <asm/loongarch.h>
>
> --
> 2.40.0.1.gaa8946217a0b
>
>
