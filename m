Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF2B322A
	for <loongarch@lists.linux.dev>; Tue, 29 Nov 2022 14:06:43 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id gu23so15830231ejb.10
        for <loongarch@lists.linux.dev>; Tue, 29 Nov 2022 06:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ezv4Cua1pgsuoHuPrWFFVv2BRJpPw4+8hGPgf8J/Hyg=;
        b=AdBEIKJ09u8waNl2wy5d78c50AAKMASyK1tqB3okY7hkJCOx/twp+I2qzX26AzNkzI
         S3zl4DzEuWLNVH/G3Jo7l5rKfGpE3CcJXkmFTTjOAtS68IElImV1z+LaU7EqF6nGHGtf
         Jn9O5rvL/GEpJHGeaUk3157BQQnVmqUxExcpArkBhBNyPy4tkfUDW45G4+tVj3/kndcL
         N/Ov94qKssSKZrTra2yCfpj/tSjulaMzQyu2m1ykhDDloqTFw48wCmlLUCjoNXcF1huk
         2pLEtTaAvB3dtRNFXDO/8ZHeJLUN9OgKP2oSMWxCOR8sHV4YsKTSZaJYDvAqwlBpFgt9
         YuDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ezv4Cua1pgsuoHuPrWFFVv2BRJpPw4+8hGPgf8J/Hyg=;
        b=2uR2/Xrxvhx8hm86ua7ONkKzse5YuIyxbqd2J+oaGvvQtmnMyRnBhsLC1vXpGSjeBm
         DihCAV3wXobOCMUhSfOaaLaBGOg+dtWUZ6QSoHfZUpRiTjCinNcyTSTosBpicx+MLMk+
         UWQItRULwyVqJXghmou/Ya9yfllJrNVtOmoqxDRT8tZMTgse1Yjsoz8ewFl8sKYUEsD5
         tp9yvQiUk05FUd3Gt7zpumvdWBq/fBLPwyoJ2A2R9XXgg7WzOjqk3ZtYmuVM5aWjK5qq
         etY5jbV+Ya/xZzyXgFvluioN3Jr5OrAQBv4Kiz5gEUHgDN28ak6QSKxa+JeHuqNyoKMG
         38sA==
X-Gm-Message-State: ANoB5plNuoWi9LvA5fQ4weQuCTHmcpsjR9UmBd0apQ9WK2ZjW79+D6PQ
	xf3XUVPB+UjOljFC3nezRblF26lI7JwAxnnRsegua39qzY8=
X-Google-Smtp-Source: AA0mqf7mi+xCfKpjk7VbrNOwH0zHT/pSLjAMJB8mSbvRLksVmfdThCMphMsZDrk29TcqPnXNZgPQVypixGS1wazD058=
X-Received: by 2002:a17:906:cc8f:b0:78b:8ce7:fe3c with SMTP id
 oq15-20020a170906cc8f00b0078b8ce7fe3cmr47964958ejb.557.1669730801633; Tue, 29
 Nov 2022 06:06:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220714084136.570176-1-chenhuacai@loongson.cn>
 <20220714084136.570176-2-chenhuacai@loongson.cn> <CAAhV-H7W8V8XdJXX5FvyvvSCAbeTSgLEKhHLivm89T-Nd59Umw@mail.gmail.com>
 <28f1be2e-ca7c-1c95-535a-2099ebf607f2@physik.fu-berlin.de>
In-Reply-To: <28f1be2e-ca7c-1c95-535a-2099ebf607f2@physik.fu-berlin.de>
From: Huacai Chen <chenhuacai@gmail.com>
Date: Tue, 29 Nov 2022 22:06:29 +0800
Message-ID: <CAAhV-H4VEqkeXpwCmZE=VqB-TTtnteAqAxbTbeT+s38QHTGdig@mail.gmail.com>
Subject: Re: [PATCH V2 2/3] LoongArch: cpuinfo: Fix a warning for CONFIG_CPUMASK_OFFSTACK
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Arnd Bergmann <arnd@arndb.de>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, loongarch@lists.linux.dev, 
	linux-arch <linux-arch@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, "open list:MIPS" <linux-mips@vger.kernel.org>, 
	Linux-sh list <linux-sh@vger.kernel.org>, stable <stable@vger.kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 28, 2022 at 8:53 PM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
>
> Hi!
>
> On 7/28/22 14:42, Huacai Chen wrote:
> > Since the SH maintainer hasn't responded, I suppose it is better to
> > let both LoongArch fix and SH fix go through your asm-generic tree?
>
> I could test on actual SuperH hardware if needed. CC'ing Geert who has
> SH hardware as well.
Any updates?

Huacai
>
> Adrian
>
> --
>   .''`.  John Paul Adrian Glaubitz
> : :' :  Debian Developer
> `. `'   Physicist
>    `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
>
