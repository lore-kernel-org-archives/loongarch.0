Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF55801
	for <loongarch@lists.linux.dev>; Wed,  2 Nov 2022 11:21:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 941D1C433B5
	for <loongarch@lists.linux.dev>; Wed,  2 Nov 2022 11:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667388108;
	bh=y6jA1qc/WukXbdnJwL8P127OXjOsKWmTp8cHhQGAsss=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XUJ1ZKx0yghv6TKuKMouii1GOMY5H1esec69h2OTdYkHDrwTsv45wrMCdHtBMpbC4
	 L/gF3GtO2pLeF9bOWhUF8w4jfjJiymYEll94AxxfIx9ZZj39CmgUpyOtG/cOGpzq5X
	 STcVXik+2IgXMdHGXMfHjOdIiuruA+eUT8qBdcVT8ovkDkZGgr/DAS72RehXCnASq/
	 AOC78AnIVxPT8wpQF6vFHD5gpQUJB4d5Bkl37J1dzwcmiPNKCwMyvX/R91zPYuIziE
	 1hd4N4o8lttwLBU0f27YvCQxebpcTX4DGYtVNFLWJhsaggf53XLy5gAXnwfYuVwdzx
	 2q/AJoScGmi/g==
Received: by mail-lf1-f51.google.com with SMTP id r12so27719279lfp.1
        for <loongarch@lists.linux.dev>; Wed, 02 Nov 2022 04:21:48 -0700 (PDT)
X-Gm-Message-State: ACrzQf3sipFit1Bt7EO686BLofZL4U7qU0jMPcWL+13QOIOunJXHWoTM
	YVkTlKp/7fFe/jWLL0iu54QIwdKFvmeRPvKrqA==
X-Google-Smtp-Source: AMsMyM7n4p9mPcI4wH0CR8GOhTrHwa9Qm734EamjzWOPQhZCF4pM+Opa28ho7vRj6nl3H4gpCETQNqI02fcLXr7e3Lw=
X-Received: by 2002:a05:6512:3e10:b0:4a2:48c1:8794 with SMTP id
 i16-20020a0565123e1000b004a248c18794mr8821466lfv.17.1667388106632; Wed, 02
 Nov 2022 04:21:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221102035249.19776-1-zhuyinbo@loongson.cn> <20221102035249.19776-2-zhuyinbo@loongson.cn>
 <166738767754.3460253.533656720238446457.robh@kernel.org>
In-Reply-To: <166738767754.3460253.533656720238446457.robh@kernel.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 2 Nov 2022 06:21:37 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+H6dgdQJJ0t=3N7q-VYbmO5cJq1VfLOu2mrm+fbg37jw@mail.gmail.com>
Message-ID: <CAL_Jsq+H6dgdQJJ0t=3N7q-VYbmO5cJq1VfLOu2mrm+fbg37jw@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] dt-bindings: hpet: add loongson-2 hpet
To: Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: Yun Liu <liuyun@loongson.cn>, linux-kernel@vger.kernel.org, 
	WANG Xuerui <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Yang Li <yang.lee@linux.alibaba.com>, Jianmin Lv <lvjianmin@loongson.cn>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, devicetree@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, loongarch@lists.linux.dev, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 2, 2022 at 6:16 AM Rob Herring <robh@kernel.org> wrote:
>
>
> On Wed, 02 Nov 2022 11:52:49 +0800, Yinbo Zhu wrote:
> > Add the Loongson-2 High Precision Event Timer (HPET) binding
> > with DT schema format using json-schema.
> >
> > Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
> >  .../bindings/timer/loongson,ls2k-hpet.yaml    | 50 +++++++++++++++++++
> >  MAINTAINERS                                   |  1 +
> >  2 files changed, 51 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/timer/loongson,ls2k-hpet.yaml
> >
>
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/timer/loongson,ls2k-hpet.example.dts:21:18: fatal error: dt-bindings/clock/loongson,ls2k-clk.h: No such file or directory
>    21 |         #include <dt-bindings/clock/loongson,ls2k-clk.h>

I assume this header is available somewhere else, but I have no idea.
Please describe dependencies below the '---' or no one can apply this.

Rob
