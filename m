Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871F92741AC
	for <loongarch@lists.linux.dev>; Wed, 28 May 2025 09:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748422826; cv=none; b=FW7yT/BF0XiA33oKkqEj7Jrr2NtfpE+VxDbnFNt4P2X9UdXrkxziMuao/G1t7Mz+dH1Uj0jeYqwOQJCDXGyT568zWNpsqJ7S8UdOmcAUQlXPjRdYt+ha1eCJX++cD3+/6MpcLHxQAnG9INhoMRzOqSGhPKr8j9hOg/8lqvgfoKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748422826; c=relaxed/simple;
	bh=t1e/HvfosFpsLoFkhIGG8ncpvv+6aZviJ2nKgmWiOW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=TX9NEGTsukKY2/QnHU0rxS+jCvfdN/NvceyzMmavSlyYwsAblk/nbp6VCdcFV5lkv89/ca9Cx2qpJyjl9C6jZVJCaG8jAwupzbVPI8N2ybEwSZ9pTaHHrcrLIdYnzUXxBrSpt38oaisZREwJt8FHpDxCMIXJFB0ckZqrUizY/C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Olyk6Dqh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Olyk6Dqh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748422823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=64QsXwazpQwW+tOYOMo7hDdSauBGVg6nC6ZKTpmi0VI=;
	b=Olyk6DqhoYGOoSK8kyobidveB+YlTkF0/GRpJEuIEy0XO6GzEDxQqHFqXsDZoMs/zgSzhk
	sSaBZPvwj5FzpoiDizen9DIwrSSi33XIynhUsUDFzC16a2u194as9YzbqHF5PxY00oLzH9
	5fQpeS6Crx2v8isLShAlLNNOxUKbjzU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-oOidWUQiMn-oS5_fRSGjMQ-1; Wed, 28 May 2025 05:00:20 -0400
X-MC-Unique: oOidWUQiMn-oS5_fRSGjMQ-1
X-Mimecast-MFC-AGG-ID: oOidWUQiMn-oS5_fRSGjMQ_1748422819
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4dcfc375aso1921937f8f.2
        for <loongarch@lists.linux.dev>; Wed, 28 May 2025 02:00:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748422819; x=1749027619;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=64QsXwazpQwW+tOYOMo7hDdSauBGVg6nC6ZKTpmi0VI=;
        b=RhGUDqrnQ5VMrdoGRx+0VwEfk7fgSeWZSlkeQ3xGjCrkMgwLkiHYdfJ7wZYu23v/yX
         AVGTftySdZGkeI7zQBnUfYHDueFdpIJdnzY+pJg+ZuD/xYfJArxUcwWFNnNzyZbCWof0
         VYRIAjYHj18qomu5WobznwMO65/YwEK5C0dLlHAXvcLg1ExkJeh/5oLVlmfAkHmCyAfm
         pggow53BZr8NbcFYZ/qy4wg+aWPykP7eg8VmARpSzfbR96CsAiNP3Z+DWMjYJKtFglA2
         lG0o6XGkMzeBAtL+4G9SVTls97gU1GVaoiDWky3bIwCcaMtFJ2vBuTX+tfDO2z3Vc3CV
         EAew==
X-Forwarded-Encrypted: i=1; AJvYcCXJ//rVZbVPqvRn0V0+1O2065a9TosHJ8ut+q9ReA5dnMfliz3yv952dQYbr/G+VvpFBhCZvCcc9zI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzhxkgpIUuK15HAzOxApFTnwDrTgHGaCqtY/VhZnWWIcc2CFgkE
	p6ZCswnBAng+IE9tnEOsy6hZhk2GkZAW1sZYpm403jxL+1F/aJcB+JC9rXeppkDphwhlsG9KFaD
	NkApBzJa3nIsB6JkpEWOxTY+MWBnRJCOA+riKuRX2eSSmg7weZWWqJdW0UGrmEA==
X-Gm-Gg: ASbGncvWQmlkfGMeza/4uy3I24uFX6NhI56eb76c8P5Hqjy4m8OiIN3U3E+KLI7+Ur8
	pnNHMIFCqaKq+5s8Fwye8JFEIxiiEgFiVPBn12SMjktnzmDkTnE7YyirCBvTc89HwEuSRtVYv0O
	Ez2nKisHTfGycZaGIIuwOkTI3QZdUnb4u6wCTiRmgZFAfwT3L9uQjEuQqDRxv8Ji3rnaSssGGIA
	djN2IIDKR8KnGKSiUaA4whwYXwnJe9SkwHMF5eWk7imkuq9ZXn0oWVoJG82EDN/y7bo3mPYkFYO
	bWON7NKX1kWf9TZgbwtaVVj5KLFRgDRwsCNZUy3pOxYy6C9z/RPsg9P+DNF+
X-Received: by 2002:a5d:5f8b:0:b0:3a3:6595:921f with SMTP id ffacd0b85a97d-3a4cb4b822dmr12928268f8f.41.1748422818887;
        Wed, 28 May 2025 02:00:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjrV5vgUL5ysXDl7B3oxB4ovG+UqKk+QHfVQ+EndsK3P47vCbb2duzqpq4xfTjaqx9Sg54xQ==
X-Received: by 2002:a5d:5f8b:0:b0:3a3:6595:921f with SMTP id ffacd0b85a97d-3a4cb4b822dmr12928217f8f.41.1748422818345;
        Wed, 28 May 2025 02:00:18 -0700 (PDT)
Received: from sgarzare-redhat (host-82-53-134-35.retail.telecomitalia.it. [82.53.134.35])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4eab0b596sm892079f8f.0.2025.05.28.02.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 02:00:17 -0700 (PDT)
Date: Wed, 28 May 2025 11:00:12 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Qunqin Zhao <zhaoqunqin@loongson.cn>
Cc: lee@kernel.org, herbert@gondor.apana.org.au, jarkko@kernel.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, davem@davemloft.net, 
	linux-crypto@vger.kernel.org, peterhuewe@gmx.de, jgg@ziepe.ca, linux-integrity@vger.kernel.org, 
	Yinggang Gu <guyinggang@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH v10 4/5] tpm: Add a driver for Loongson TPM device
Message-ID: <gymx5tbghi55gm76ydtuzzd6r522expft36twwtvpkbgcl266a@zelnthnhu7kq>
References: <20250528065944.4511-1-zhaoqunqin@loongson.cn>
 <20250528065944.4511-5-zhaoqunqin@loongson.cn>
 <7ifsmhpubkedbiivcnfrxlrhriti5ksb4lbgrdwhwfxtp5ledc@z2jf6sz4vdgd>
 <afaeb91a-afb4-428a-2c17-3ea5f098da22@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <afaeb91a-afb4-428a-2c17-3ea5f098da22@loongson.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: d6fADN-7vnc0hoU7z7A39-nO_yAA00gi1two5BqiQVA_1748422819
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, May 28, 2025 at 04:42:05PM +0800, Qunqin Zhao wrote:
>
>在 2025/5/28 下午3:57, Stefano Garzarella 写道:
>>>+    chip = tpmm_chip_alloc(dev, &tpm_loongson_ops);
>>>+    if (IS_ERR(chip))
>>>+        return PTR_ERR(chip);
>>>+    chip->flags = TPM_CHIP_FLAG_TPM2 | TPM_CHIP_FLAG_IRQ;
>>
>>Why setting TPM_CHIP_FLAG_IRQ?
>
>When tpm_engine completes  TPM_CC* command,
>
>the hardware will indeed trigger an interrupt to the kernel.

IIUC that is hidden by loongson_se_send_engine_cmd(), that for this 
driver is completely synchronous, no?

>
>>
>>IIUC this driver is similar to ftpm and svsm where the send is 
>>synchronous so having .status, .cancel, etc. set to 0 should be 
>>enough to call .recv() just after send() in tpm_try_transmit(). See 
>>commit 980a573621ea ("tpm: Make chip->{status,cancel,req_canceled} 
>>opt")
>The send callback would wait until the TPM_CC* command complete. We 
>don't need a poll.

Right, that's what I was saying too, send() is synchronous (as in ftpm 
and svsm). The polling in tpm_try_transmit() is already skipped since we 
are setting .status = 0, .req_complete_mask = 0, .req_complete_val = 0, 
etc. so IMHO this is exactly the same of ftpm and svsm, so we don't need 
to set TPM_CHIP_FLAG_IRQ.

Thanks,
Stefano

