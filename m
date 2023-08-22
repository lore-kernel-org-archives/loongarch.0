Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CDD3FE0
	for <loongarch@lists.linux.dev>; Tue, 22 Aug 2023 06:20:30 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-9a1869f2c06so477055966b.0
        for <loongarch@lists.linux.dev>; Mon, 21 Aug 2023 23:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692685228; x=1693290028;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AdjocTBHOtnth2NKa2sExvTI57TFDAqcca22DEvACmA=;
        b=L574EEwWd5asi4wbA5UwJqrBz+MPhQctyH66wweQd5iFPX84sxkVhGxe57X6QT8eWq
         TMg+5aWTcl5d28OxO+fAbVwmTwL3DMkc+upfQM26izng8203kSAexXco5gXdkpDZAzEf
         YtlFGPRbd/nC1cc8LiSU/IEG1Fh67zN47dNM65Uw98q2jYVMnUrLKeZ7wLz1gitbnqvY
         nrziqlT41sCSTZyty8CHqezoS882l9yZMTfVHBco8yph5vqzRVJjrp0NwMX6mDSnDtb6
         JjvFkp8xRZfIEKjfv0kUWiEZ9Txhbzt6CO4/kwUF8pUgYV+H1zah4RrCjk6cIYlILSz/
         HI7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692685228; x=1693290028;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AdjocTBHOtnth2NKa2sExvTI57TFDAqcca22DEvACmA=;
        b=dJgTQ0xh30w45A+7y/Iggtm77gjc6SSro63pwskh3VVSjMNQA9PE4Sljrq9BFR0nB2
         wrbBANsZqBIhGmz0DIy6vr7YuI9jDrsmGcfgjiNQr85hjmTPVFUrgn9bIrH7p/kNQQxH
         tR7/5TwU6nsgpf2su/+EGv8sYaKwM6tOgs2MtxMpQZGpXTOySmXp7bhmsNHE0e1fsL0T
         lyeH43ZqQp1bk+SGrvtwW/Lp138BIBoRedafdwcgQneRJi5HuorNWj2T9+m9AbSdMS6T
         RCPdBgVgzQG2asYiw7FkBE4LrtxuZYxpF9dsCa9vpq/ncQQ+4l7ZtxZpn3tmaaEcJJQG
         9qww==
X-Gm-Message-State: AOJu0YwrA0gi0YfD/Nz8x7znE6ckgEWKEQiTW0dqnPvG/jN7INvXJ6QW
	15WCOSvsTbE2bMloOQOK2RSLbw==
X-Google-Smtp-Source: AGHT+IHDrmAsqqMTvg2qcb0k1Z8N+wmcDtnBH1ocLOrTdRH7lGbN1jLpGxGJ7SMK/CZlULHNLTxY4g==
X-Received: by 2002:a17:906:846b:b0:9a1:b528:d0f6 with SMTP id hx11-20020a170906846b00b009a1b528d0f6mr1662394ejc.27.1692685228219;
        Mon, 21 Aug 2023 23:20:28 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id la14-20020a170906ad8e00b00982a92a849asm7680520ejb.91.2023.08.21.23.20.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Aug 2023 23:20:27 -0700 (PDT)
Message-ID: <27c1feeb-7661-7583-c168-f87ecb14ecff@linaro.org>
Date: Tue, 22 Aug 2023 08:20:26 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 2/7] dt-bindings: loongarch: Add Loongson SoC boards
 compatibles
Content-Language: en-US
To: Binbin Zhou <zhoubinbin@loongson.cn>, Binbin Zhou
 <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Cc: Huacai Chen <chenhuacai@kernel.org>, loongson-kernel@lists.loongnix.cn,
 Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Hongliang Wang <wanghongliang@loongson.cn>,
 Conor Dooley <conor.dooley@microchip.com>
References: <cover.1692618548.git.zhoubinbin@loongson.cn>
 <0c27857ee0ac7e287b24b37e1b6ab9d5cc524ae1.1692618548.git.zhoubinbin@loongson.cn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <0c27857ee0ac7e287b24b37e1b6ab9d5cc524ae1.1692618548.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/08/2023 14:49, Binbin Zhou wrote:
> Add Loongson SoC boards binding with DT schema format using json-schema.
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../devicetree/bindings/loongarch/boards.yaml | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/loongarch/boards.yaml
> 
> diff --git a/Documentation/devicetree/bindings/loongarch/boards.yaml b/Documentation/devicetree/bindings/loongarch/boards.yaml
> new file mode 100644
> index 000000000000..5092314b7a52
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/loongarch/boards.yaml

loongson.yaml

I suppose you might have here different manufacturers?


> @@ -0,0 +1,34 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/loongarch/boards.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Loongson SoC-based boards
> +
Best regards,
Krzysztof

