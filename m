Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3738F53
	for <loongarch@lists.linux.dev>; Wed,  9 Nov 2022 10:16:03 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id t25so45340053ejb.8
        for <loongarch@lists.linux.dev>; Wed, 09 Nov 2022 02:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pMdsq5H+6Eg0hvqJw3g6zxey1x9uU7yagkyLzIBH/F8=;
        b=Mf4BNQPHb+LkQAXlb/zm2rbrYtltLFna6nc2Es5lq8bJEJ7rDh5wWXb5VkkK3/kUYf
         JqZ44+Pi2/+t1XBglDDFxNwhZ0Fn2xsUhxjfWUXoRRSR2+zBg/bJ8kap//H+CajrVAni
         cbDNGfypzUF2W//Pc9OJEatkwT5vAGlVsIwXU34LesicaLUQRSeBms0HTcF3jVXeQgem
         d/g6eG09j0VdiIfCTn2N5473qcM76Av/rrpDT/SEt2hrd0qh41SGOIvqZQLILodXGr0Y
         /dFVhZLeGMPLJCE4WE/w0xlAufUt0Ltc1l4DVdWqp+ZIOV74v/ptSpG/vkSTfBiHxcGE
         OLIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pMdsq5H+6Eg0hvqJw3g6zxey1x9uU7yagkyLzIBH/F8=;
        b=WkGokrRQ9P/orUIjiOHjDViImHuYJvoI7eyrWItdtvJiSnYz/OYnP35cSSTEK/Ated
         bGX/AwzdU4p+4W4s4h06Al7QDenzI26A86AuWePPFRhVILmd5jjZ6U55nGrUr1qGFodX
         i29zous8dtxd94g1cxOFYDErdaaQp/fnTCGFF8rA1miEJsOJiNOqU+WLTCNYsT/5D5eJ
         XfPObepZZV25eC3b7j70+kroVfpCD86emVYpnc8noBeEOMxJFdtwYAdOAXWiph0iBbfk
         b+MeXEp+E36xC3wiXyaxKyKvCF9+VDJlxwOH7EO6H0Zrr3zK2zYtsGMYzxGNRImoI0uY
         7KdQ==
X-Gm-Message-State: ANoB5pk0TcUc/m1vWoS2QljITbiV62A0CvkIxqXm0ED4D0ZLCkvTRmJD
	rTgXPuDTlC9DMfOiNVn3eypZxAlLwEPb4j9sgKoUUQ==
X-Google-Smtp-Source: AA0mqf5TF33fQF20BTjL+3ietwm8wjDul9XW+jKaFBmLAPAOQ0xs+i8deVVZ1I0zgS5VF8Q1mxfrofhVMn/oYL/Vdak=
X-Received: by 2002:a17:906:6acc:b0:7ae:658c:ee45 with SMTP id
 q12-20020a1709066acc00b007ae658cee45mr14661004ejs.190.1667988962150; Wed, 09
 Nov 2022 02:16:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221104024835.3570-1-zhuyinbo@loongson.cn> <57c9f565-e75b-0c8f-fdce-9dc8c334d50f@loongson.cn>
In-Reply-To: <57c9f565-e75b-0c8f-fdce-9dc8c334d50f@loongson.cn>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 9 Nov 2022 11:15:50 +0100
Message-ID: <CACRpkda=-_a+gWQVk1vi4QJ30j-hzeraX-wr86RcQ9xne4-d6Q@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] soc: loongson: add GUTS driver for loongson-2 platforms
To: Yinbo Zhu <zhuyinbo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Hector Martin <marcan@marcan.st>, Lubomir Rintel <lkundrak@v3.sk>, 
	Conor Dooley <conor.dooley@microchip.com>, Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>, 
	Heiko Stuebner <heiko@sntech.de>, Brian Norris <briannorris@chromium.org>, 
	Sven Peter <sven@svenpeter.dev>, loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, soc@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 9, 2022 at 11:03 AM Yinbo Zhu <zhuyinbo@loongson.cn> wrote:

> Hi maintainer,
>
> This patch I had verified that base on mainline 6.1-rc3 tree, it is
> okay, if no other issue, please you help me merge it to upstream.

Aren't these loongarch maintainers listed in MAINTAINERS able to
merge this? Certainly Huacai can merge stuff to drivers/soc as
need be. drivers/soc is a bit shared between different archs.

LOONGARCH
M:      Huacai Chen <chenhuacai@kernel.org>
R:      WANG Xuerui <kernel@xen0n.name>
L:      loongarch@lists.linux.dev
S:      Maintained
T:      git git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git
F:      arch/loongarch/
F:      drivers/*/*loongarch*
F:      Documentation/loongarch/
F:      Documentation/translations/zh_CN/loongarch/

Yours,
Linus Walleij
