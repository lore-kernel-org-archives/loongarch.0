Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A55438DC8
	for <loongarch@lists.linux.dev>; Fri, 12 Apr 2024 18:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712945468; cv=none; b=BUDmgqFV87Wv+uWdITqldaurbQoTEEwojVzZAyjH2y6XhMjBU7LmpL9LAKnxrO5GtCWOEoVow2rVe0ysuq2qhDYarziJ26taXvwTFzUv10J29XXYL7W1smFsZoadqJ+/49DjtnkcrBkS/+U0fVWmHaOEEhkQ9Is735rngHEAIxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712945468; c=relaxed/simple;
	bh=X8JAZ83PISoSih6UqWtdaIMVzQTC/9WJWILUPIQBXJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nRHofX9591XTo6IkeCIZMgIq4ERbH3Y73NlPjlxncuP5el+1cmT8SAqctZIoDHk5Z5TMCYZNoOx0ZnuLFCeLC/cN8gDZ1SGjQhfVW0nmltlxVQH2BmlW34IMYBef/m5ay+grApzhgtz8Fdy3f1bgr6ZJQWFWI/G1tFftC+fwdbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mxpkxDII; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mxpkxDII"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1e504f58230so10709555ad.2
        for <loongarch@lists.linux.dev>; Fri, 12 Apr 2024 11:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712945466; x=1713550266; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0JthIKMm0QudgaXVbOYMQ9cuPyBbvwy6KmupLEHj/Ww=;
        b=mxpkxDIIjjyq6dnlE527Tn61E3x3Fa6cfMjGmWnaBa2jEFVIRWsaOgsgoaxUzuNACp
         EQqIdGYUkotHYqkt+NJMSKu3vr9n46J3EHOPLd5QEIMnosxxF8R0QcDOZT9rljdJoNfq
         CM+6/9gpFAN+3Q/X8s14dGGlW8RHtoRrkUmeHt1SRDM4Zpy5IogpYuNE8snlPanlpN3G
         H2blPJwNriaeYwC+TwWbbTvYnFr4A7pIUebNMsvTiTpXuw/NrTtVfHc4CCa9hwg4MU3w
         QPsZrownXrvlB0XGyMABVlfarmQEvoorQlmZZjA2jEcFFdmv0F4M+g3lBANgA2qdXCsz
         Ef/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712945466; x=1713550266;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0JthIKMm0QudgaXVbOYMQ9cuPyBbvwy6KmupLEHj/Ww=;
        b=jnhem26+tW7P1BxoJBvDfOJzubbRL+K1AK0fcTNMuUFsIuuoDMbGzONnL5woZx8ksm
         BiuihH/E+YWKNpft+P/RCjEsz8+Jx/e9OeMn7RlamcxilsCqIqRDUkcEIFmjqamzT+s0
         p8Djqv6z6Dm0XgfrROp3gOMt3amFCaGZD6kptm9zX3uOswDsjM9emtPg/X7Bw/6uA1hd
         NTsbdT3kodyDRgzC5a4g6X9MchCtVy1qnO8Y5m0i/rKCQa/lIpvhm1vDJ6eQFChVMWPo
         0CwDLHA5hh4tts5yNaBaeH96lt0AMWJav24KSxZT4SZjc9hf0F2vhSAgJBdtZHt20lz9
         unTg==
X-Forwarded-Encrypted: i=1; AJvYcCU5hA8ouTwMTwNzzeG/C3VT5EuNCtJLILf8gwAwqe2hRRzUbXilnOPHkElOH7r29DADmaZn1ILjKBu/QpbuVfmiBRi8Ww+IQJn9
X-Gm-Message-State: AOJu0YxYZITBpCBYgL7DfKa6bYgwd6k9BZ7PjMs9KvVOhWmKIxLUq0Wh
	zpS8vnDqIsHdp1ShY6l1/eh83kXkTS51PX3ozHq7Fi6oAp2vBKnE
X-Google-Smtp-Source: AGHT+IE0PSTDSZKKtsu0hbpf/Klp71X2ePxEwc6wEp4D3GSUygJCRHA20izUrDuTvbH4UoBXRzSJUQ==
X-Received: by 2002:a17:902:9a08:b0:1e5:870a:b2c0 with SMTP id v8-20020a1709029a0800b001e5870ab2c0mr3134934plp.14.1712945466289;
        Fri, 12 Apr 2024 11:11:06 -0700 (PDT)
Received: from localhost ([2620:10d:c090:400::5:a5f4])
        by smtp.gmail.com with ESMTPSA id h11-20020a170902680b00b001e0bcccc800sm1283613plk.35.2024.04.12.11.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 11:11:05 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date: Fri, 12 Apr 2024 08:11:04 -1000
From: Tejun Heo <tj@kernel.org>
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: axboe@kernel.dk, chenhuacai@kernel.org, josef@toxicpanda.com,
	jhs@mojatatu.com, svenjoac@gmx.de, raven@themaw.net,
	pctammela@mojatatu.com, yukuai3@huawei.com, qde@naccy.de,
	zhaotianrui@loongson.cn, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
	cgroups@vger.kernel.org, yi.zhang@huawei.com, yangerkun@huawei.com
Subject: Re: [PATCH RFC v2 6/6] blk-throtl: switch to use rq_qos
Message-ID: <Zhl5ONFlPg4vqjGj@slm.duckdns.org>
References: <20240406080059.2248314-1-yukuai1@huaweicloud.com>
 <20240406080059.2248314-7-yukuai1@huaweicloud.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240406080059.2248314-7-yukuai1@huaweicloud.com>

Hello,

On Sat, Apr 06, 2024 at 04:00:59PM +0800, Yu Kuai wrote:
> From: Yu Kuai <yukuai3@huawei.com>
> 
> To avoid exposing blk-throttle internal implementation to general block
> layer.
...
> @@ -832,7 +832,7 @@ void submit_bio_noacct(struct bio *bio)
>  		goto not_supported;
>  	}
>  
> -	if (blk_throtl_bio(bio))
> +	if (rq_qos_throttle_bio(q, bio))
>  		return;
>  	submit_bio_noacct_nocheck(bio);
>  	return;

This is a half-way conversion, right? You're adding a dedicated hook to
rq_qos and none of the other hooks can be used by blk-throtl. Even the name,
rq_qos_throttle_bio(), becomes a misnomer. I'm not really sure this makes
things better or worse. It makes certain things a bit cleaner but other
things nastier. I don't know.

Thanks.

-- 
tejun
