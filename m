Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8218B33D1
	for <loongarch@lists.linux.dev>; Mon, 13 Feb 2023 14:28:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41126C433A7
	for <loongarch@lists.linux.dev>; Mon, 13 Feb 2023 14:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676298517;
	bh=E4LVZvWW+7vAA9+BkosJMQCtMFxWg1rIQeJAsTCdtzo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dLnWY8Tlfl6stw2OZFDay7dVkedLZxdtUWlVpTaAwVCCfwWHzXAA+kuOISqX/4NNp
	 9xGO7rBWkjJNhOmnvlpxC1axosJb4STDmd4zqQ6dhdQnsm47cKDZX+8Z43x1fzqZcE
	 REd+Vqr5J4eAzLsfuWnpm/HOXmqzEoaPOcnW0VNABkn0i1CU8+JJdD1SQRCfMYdPxj
	 STXeI59tnG0Dlm/B28z/o7LLp+IRLUxjuvQequLgwqQNJG/iF4RwNAm9GycIvZW2jd
	 8b33Vv+47oAJApoOJALbBq0l6Wc3wmawra8VQkicCz/VEHfHY89vXP+u0ph7KTVyEv
	 XwB3pEWyfzd+Q==
Received: by mail-ej1-f42.google.com with SMTP id lf10so455927ejc.5
        for <loongarch@lists.linux.dev>; Mon, 13 Feb 2023 06:28:37 -0800 (PST)
X-Gm-Message-State: AO0yUKX1fQByAa2RCv4RRyqBEzyyn1ufq+kxpxz136xjiB3QGszv7xPR
	iyMXhLNevUb3Sh6IgMZfrYEfIYJZ5ba4slm8C90=
X-Google-Smtp-Source: AK7set+B0QjPIbwkuKe7nWMC37VzqT42GBGsuEuJ4Nu+3/g5FaPQ6gMhgRwydGTDlABu3VTmwU4jWqLiwc33x74RgA0=
X-Received: by 2002:a17:906:8557:b0:87b:da7a:f202 with SMTP id
 h23-20020a170906855700b0087bda7af202mr4657088ejy.1.1676298515528; Mon, 13 Feb
 2023 06:28:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1676289084.git.zhoubinbin@loongson.cn>
In-Reply-To: <cover.1676289084.git.zhoubinbin@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 13 Feb 2023 22:28:20 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5APruqAryFJiHBzu+X9dw79-tEVw59kBPX0Q93Lnr3Cg@mail.gmail.com>
Message-ID: <CAAhV-H5APruqAryFJiHBzu+X9dw79-tEVw59kBPX0Q93Lnr3Cg@mail.gmail.com>
Subject: Re: [PATCH V2 0/2] Loongson: irqchip: Add loongson-eiointc DT init support
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jianmin Lv <lvjianmin@loongson.cn>, 
	Huacai Chen <chenhuacai@loongson.cn>, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

On Mon, Feb 13, 2023 at 8:15 PM Binbin Zhou <zhoubinbin@loongson.cn> wrote:
>
> Hi all:
>
> Add EIOINTC irqchip DT support, which is needed for Loongson chips
> that are DT-based and support EIOINTC, such as the Loongson-2K0500 SOC.
>
> We need to handle the "parent_irq" and "eio-num-vecs" parameters passed
> from DTS.
>
> Thanks.
>
> ---
> V2:
> - Add the dt-bindings file (1/2);
> - patch(2/2)
>   - Remove forgotten debugging messages;
>   - Rename properties name: "vec_count"->"loongson,eio-num-vecs";
>   - Change compatible string name to "loongson,eiointc-1.0".
>
> Binbin Zhou (2):
>   dt-bindings: interrupt-controller: Add Loongson EIOINTC
>   irqchip/loongson-eiointc: Add DT init support
>
>  .../loongson,eiointc.yaml                     |  80 ++++++++++++
>  drivers/irqchip/irq-loongson-eiointc.c        | 119 +++++++++++++-----
>  2 files changed, 165 insertions(+), 34 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,eiointc.yaml
>
> --
> 2.39.0
>
>
