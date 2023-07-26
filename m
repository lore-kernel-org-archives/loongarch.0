Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792F99456
	for <loongarch@lists.linux.dev>; Wed, 26 Jul 2023 08:05:40 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-52229d3b8c8so4743020a12.2
        for <loongarch@lists.linux.dev>; Wed, 26 Jul 2023 01:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690358738; x=1690963538;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wAHUQ8fB6FGgHFeTYFJpEoe7c/sqaC3KeyYejkkBsfE=;
        b=k+qqrxnCxTnSv0JS4TM2MVG/86jPA2QGCR8vVSQrKTNLIZvoCHFAGNtvHwYlWne+nR
         u2VVErVNZtfbA2qmx+I044+t2dS5XFCTw/KW/aFZQa0LNkau5oZMVKgPaaIhynMFZx8T
         C1PqB14vPiE8Jpjtn6Rrn3fzZX9Hd1yiTMYn8b/9vl6YN5JMbYDspJe0Cl7pgdqhIBry
         xadJ40gaCvOs0EWSI6ycFpglFFFrV+57ulGbWf1HblyUSzC1FnhduZrgrQfwUZDK7ozp
         5rZ5LocqVPzCzj8RLhAsYjFvayK1Xn4rkk0FO400T2RsYwJtPOXQpuOoG+tckeR+sozb
         LkCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690358738; x=1690963538;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wAHUQ8fB6FGgHFeTYFJpEoe7c/sqaC3KeyYejkkBsfE=;
        b=IjZhJBTSubqMFpR2ZxXyngVrrzpDvgxQY3CHjbhRoATvFOc/iuoYRVnlQgn7Gsu4b9
         GcFoODOi/RoU1NjxHwQtpjjvFBpdldFROAi2xbj7nKPa/11bnvtRJDUsMIZOjC3Lydao
         DtOxI0/VOwQPagSLsjP6Mmc6xWjj8Glq0NjnIB+Si0Tmk+Vu4yAGid2UhVoGQAOr/fp9
         Rnt2rlEOs/272Cbrmm5BY3s1dcbjExgBw3w6mU1J/aKd6+mfhXCvV8dmek03CegT2mjR
         YyYZ9iqtBkhvTtlIqoQcKrCGI+nKg+u7S83GYl12Nq4kI1PI8ZkIMEH7fK9sgAsaXfLa
         164w==
X-Gm-Message-State: ABy/qLYs/C4DoA9ckTSRYiho/P874xVEzzKrn68JaKThmkoOAMMcEjf4
	kQgR+kVHL87sxkvl8/ioDP5PGg==
X-Google-Smtp-Source: APBJJlGXqrlH1L3HW/5n5DFFk+S3iCmieB/iM2I8GQM6MuItXN4lAIxlK+OxT+lcgGKQKjfcjjHvww==
X-Received: by 2002:a17:906:7692:b0:987:498a:87f6 with SMTP id o18-20020a170906769200b00987498a87f6mr875048ejm.34.1690358738498;
        Wed, 26 Jul 2023 01:05:38 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id jt14-20020a170906ca0e00b00992e51fecfbsm9380573ejb.64.2023.07.26.01.05.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 01:05:38 -0700 (PDT)
Message-ID: <1ad985f9-2738-8b42-a8e2-c2312ec57d9e@linaro.org>
Date: Wed, 26 Jul 2023 10:05:34 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] ASoC: loongson: mark OF related data as maybe unused
Content-Language: en-US
To: Xi Ruoyao <xry111@xry111.site>, YingKun Meng <mengyingkun@loongson.cn>,
 broonie@kernel.org, lgirdwood@gmail.com
Cc: linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 loongson-kernel@lists.loongnix.cn, kernel test robot <lkp@intel.com>
References: <20230726070648.700754-1-mengyingkun@loongson.cn>
 <174b4c41d10fa1b31821482ec737733ca4633464.camel@xry111.site>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <174b4c41d10fa1b31821482ec737733ca4633464.camel@xry111.site>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/07/2023 09:20, Xi Ruoyao wrote:
> On Wed, 2023-07-26 at 15:06 +0800, YingKun Meng wrote:
>> The ASoC Sound Card driver can be compile tested with !CONFIG_OF
>> making 'loongson_asoc_dt_ids' unused:
>>
>> sound/soc/loongson/loongson_card.c:200:34: warning: unused variable
>> 'loongson_asoc_dt_ids' [-Wunused-const-variable]
> 
> Hmm, why not guard the definition with #ifdef CONFIG_OF instead?
> 
> Source text is first and foremost for the human reader, not for the
> compiler, and an ifdef clearly shows the condition when the definition
> is not used.

Rather drop of_match_ptr so this can be used also on ACPI.

Best regards,
Krzysztof

