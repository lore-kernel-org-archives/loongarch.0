Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAD223B9
	for <loongarch@lists.linux.dev>; Sat,  3 Dec 2022 10:03:58 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id j196so8864470ybj.2
        for <loongarch@lists.linux.dev>; Sat, 03 Dec 2022 02:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N6E8CnP3iI5t13RtsJQQcTXnbZ3ZGPTmoPz8kIfTx4U=;
        b=k0vaNbXpIr1SS/R+YqWWkyExuOQIYt3c8XfhEfqDa9Z2UuX4cdm9VdUn/4gHGMUxtH
         5FyGA8rU9sdTo1UFjoFc5JgDdVGmXSAMsZY35MJUnaSncVbVYJXR5j+p4TrjstZjq8xz
         JCOEDr9BdvQQTTPf+fFgcjUCv9YGPv4mVcHvxJXJ93CWUynMjTGe4Blq/e83y+RDFEbV
         XMjN1RKwqXqIe+4mElvNvFbFzfFjRxyuttUTmR4wfjxopzy3yay/5qCYu1jvusRq7z6t
         DH2pwodZDL90KwVCuHcpmsO0+iSnBUNAUL3svPVBSnVusbSa4QZJnaqVQwCqoNaXBs8x
         3gXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N6E8CnP3iI5t13RtsJQQcTXnbZ3ZGPTmoPz8kIfTx4U=;
        b=vHy0rUPfz3cTAgCGC/+1lv6si5Y2GX0MyCjIbtBNDc0BmTWWs79Ds4sDTUyiKL4vIT
         DtHi70wQthjv5rC1Nli3l8a78CSLfv0x98yB5K30sVBmsqy2fCYxUPfqAK0/4DounY6C
         ehIbQe6HWsgUdd2aM9VCL27FFMTQMpHWeGUgzkk4TYA5Bj/uj7uwsGTc0Qn/1UroKHL5
         euOZ9g7tMxqVoTTMfhHIsEBILUYWsRhCuDrpcwyo382ZldysE00LVDElgPr2L2phVMTl
         N8yrzaqNQMjDPlEDsV87Tc1eIwSVec7DBOQmUBgiPD9yQ6q1IIHEVVyRv7Xjj2wRjLhl
         RSuw==
X-Gm-Message-State: ANoB5pknm1HgWmjVy9PHoUG8jpZvJnimWjAVFw8Kdl1TasDNpeqlhgqE
	TeIViFhqwO+d/mf6zlHTo87akuq5tBGKp0kZ6yMW0w==
X-Google-Smtp-Source: AA0mqf6D4lrppamEcD0PVhGEQxhIID44UmELO3zkV8dlr+HoqpZTBr+TgBXi4XgTOEHh0lS6bXQVtURTpgndyWewC8k=
X-Received: by 2002:a25:d8d4:0:b0:6f0:36e2:5fc2 with SMTP id
 p203-20020a25d8d4000000b006f036e25fc2mr46503178ybg.52.1670061837556; Sat, 03
 Dec 2022 02:03:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221201123220.7893-1-zhuyinbo@loongson.cn>
In-Reply-To: <20221201123220.7893-1-zhuyinbo@loongson.cn>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 3 Dec 2022 11:03:46 +0100
Message-ID: <CACRpkdZm-4-5625szX_VqJoQH1OQZnw+jH3SqWsb9nr3S0Nbmw@mail.gmail.com>
Subject: Re: [PATCH v10 1/2] gpio: loongson: add gpio driver support
To: Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, WANG Xuerui <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Juxin Gao <gaojuxin@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Yanteng Si <siyanteng@loongson.cn>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	Arnaud Patard <apatard@mandriva.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Jianmin Lv <lvjianmin@loongson.cn>, Hongchen Zhang <zhanghongchen@loongson.cn>, 
	Liu Peibao <liupeibao@loongson.cn>
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 1, 2022 at 1:33 PM Yinbo Zhu <zhuyinbo@loongson.cn> wrote:
(...)
> +config GPIO_LOONGSON_64BIT
> +       tristate "Loongson 64 bit GPIO support"
> +       depends on LOONGARCH || COMPILE_TEST
> +       select GPIO_GENERIC
> +       select GPIOLIB_IRQCHIP

If the kernelbots start complaining you might need to add a:

select IRQ_DOMAIN_HIERARCHY

here.

Yours,
Linus Walleij
