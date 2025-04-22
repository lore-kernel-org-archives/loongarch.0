Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1B928152D
	for <loongarch@lists.linux.dev>; Tue, 22 Apr 2025 13:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745328463; cv=none; b=ZvQFC4md68f+w0O8EZjAHFEDJ5FF5TWZ4gYpsHojEYbwVQMC86ZM7QZ9men/U5DTP1JlTrlCBhr9zggX+9pOfQST+nKIZrKGxfGBBaY8CcBE2BYCZYTEOV1IM3fuZix84kHnX0ZcrONp1Y4slgzx4tJAvcVEVGhfJfGZpNY5/JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745328463; c=relaxed/simple;
	bh=EQCtPB6vig1BWXkhsUPFWKuYqQaajrFDU8o+69PjzzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t1tbKLXO/izigmQY1rWRmHv2IJ5O/h3gWrZ+9xKL3jOTIjPFqo5lAdU2deuwT8ss0ykQIyPLIjBHqSqq4TUnktDVyMw8AL9vZQeNrnBYQrqU/UebBVL3wQRIabDV2eV+xLesaI06ceH0Nd2F1TSq/fB2SxOalOOvLgrcP+f46Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ou+qbLdI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ou+qbLdI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745328460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7UwdpGD0fRMaU1gXvakXekOim8TBkzbwWuAWNIFkxTA=;
	b=Ou+qbLdIr2s7YhogsnJ8DycCeHJFQ9rEc1Ajd8BRmaSNDacFWECNapdNWByKWAtdpgrO+m
	vpibRPuXi2M2b9dTz4GV0BJiAsjpmF2+HC3GWkckS7EIOXY3NeCJb4JGVycA0/0RhLEVrG
	4Yqk7rDlZ3jdgtzBQ1GuBD46sPkMkOQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-5HJC-mS0Pw6CRJ2l0AmeAw-1; Tue, 22 Apr 2025 09:27:39 -0400
X-MC-Unique: 5HJC-mS0Pw6CRJ2l0AmeAw-1
X-Mimecast-MFC-AGG-ID: 5HJC-mS0Pw6CRJ2l0AmeAw_1745328458
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43d4d15058dso37348325e9.0
        for <loongarch@lists.linux.dev>; Tue, 22 Apr 2025 06:27:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745328458; x=1745933258;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7UwdpGD0fRMaU1gXvakXekOim8TBkzbwWuAWNIFkxTA=;
        b=p5PERUocNFjZ+7MpcFPFZBuiX56670RJ1Y3n2geZWk//24DJdblwx6M6R1083MVvvS
         SOYU6ktWKOjtuKS39i9sDvk6G2D2UAbFZUO1XmVNl3MwYenZKP6q7FmkWef3yrP9olhK
         4hL5/i9RdBesumSX7G92240Vk0x841VkDNtqwXSs/7UoGzs1MWcUDEUDC1ukJ8VnVi3H
         OfuZUqOvXinbZGDBcLsHCvErIP7N+IZHKSwhztYPORCqRVh678R66MwJyjPcZPX/2njd
         bP6Scp6nCDnvh++We7G62Igz/00UaTlTFZjPyjGhYEbbvQbgRaM18x1rqwWWNi8Q+/JX
         mLKg==
X-Forwarded-Encrypted: i=1; AJvYcCU0im3SIULWoKwVtrMiELhzLzMpp9AVQXMP/yoMf5hn0ETlTlVE6zEWkF4J6gX3GT9PWyVSsQuvr8U=@lists.linux.dev
X-Gm-Message-State: AOJu0YyjF1P/Y1zWMDDrlvVsj20xjguNgEBFTklKg2kUeeLG8kuw/P+2
	3hmKqRZFX/c4xvMJ/kZE0dX72W0Y7RxqDHXPlXN1ZFn2siJupYJsGa9KAVcqyE/Ane3FcWndHAh
	6p3NG8GO10VMDyqFfX4LNPA+RfTrNpYCo8kS0gJreuy/9QYGKrfOYuQOyWQ==
X-Gm-Gg: ASbGncvHi0Xyx1UwRqrGzNxZyAAa5Bn8/QmwmUQmWYf/zA3Owh2e+mjAnOvMGu/Oy0o
	lcXoR6ioaYsNxIGCEOFzNrPpBADGzqk5nRgjJtzxxDeE9GO2ETmPFzkvhrbjZurgQOcrVvNH0Ru
	U3HPuv8GSJQJUtjlehxv20cLlPT/Ytj2kDbnEbV/EDu9w2RDZLfNOaKp32a1yLrutdjlXMrMzFt
	4hKjgbBbZs+7TORSW7NH3/8N0qkkBHqXiriJxNecexCy74vVbb5n3mODR/tL5/BlM8dbIeR16aq
	KLT0B7MfoXRC2jqMkRCUfa6ElmT4pGJC6E8c
X-Received: by 2002:a05:6000:401f:b0:39a:c9fe:f069 with SMTP id ffacd0b85a97d-39efba5c445mr11588009f8f.30.1745328458268;
        Tue, 22 Apr 2025 06:27:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMFkPqpRqcNuzcFnHj6Skl43ARpjqnMI6BNLMea1wY6RizjcHM5ktMU4nEoG/0S/ogkDjhNA==
X-Received: by 2002:a05:6000:401f:b0:39a:c9fe:f069 with SMTP id ffacd0b85a97d-39efba5c445mr11587993f8f.30.1745328457846;
        Tue, 22 Apr 2025 06:27:37 -0700 (PDT)
Received: from [192.168.88.253] (146-241-86-8.dyn.eolo.it. [146.241.86.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5bbc13sm172207495e9.17.2025.04.22.06.27.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 06:27:37 -0700 (PDT)
Message-ID: <845bd2b4-a714-4ddd-8ace-a45dcdbd486c@redhat.com>
Date: Tue, 22 Apr 2025 15:27:35 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next V2 2/3] net: stmmac: dwmac-loongson: Add new
 multi-chan IP core support
To: Yanteng Si <si.yanteng@linux.dev>, Huacai Chen <chenhuacai@kernel.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Feiyang Chen <chris.chenfeiyang@gmail.com>, loongarch@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew@lunn.ch>, Henry Chen <chenx97@aosc.io>,
 Biao Dong <dongbiao@loongson.cn>, Baoqi Zhang <zhangbaoqi@loongson.cn>
References: <20250416144132.3857990-1-chenhuacai@loongson.cn>
 <20250416144132.3857990-3-chenhuacai@loongson.cn>
 <fe0a5e7a-6bb2-45ef-8172-c06684885b36@linux.dev>
 <CAAhV-H5ELoqM8n5A-DD7LOzjb2mkRDR+pM-CAOcfGwZYcVQQ-A@mail.gmail.com>
 <99ae096a-e14f-44bc-a520-a3198e7c0671@linux.dev>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <99ae096a-e14f-44bc-a520-a3198e7c0671@linux.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KWF2OlqEpbLznyyhzDjyyH6jFCQ0ELGl_56hPVIT3Q8_1745328458
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 4/22/25 4:29 AM, Yanteng Si wrote:
> 在 4/21/25 12:20 PM, Huacai Chen 写道:
>> On Mon, Apr 21, 2025 at 10:04 AM Yanteng Si <si.yanteng@linux.dev> wrote:
>>>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
>>>> index 2fb7a137b312..57917f26ab4d 100644
>>>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
>>>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
>>>> @@ -68,10 +68,11 @@
>>>>
>>>>    #define PCI_DEVICE_ID_LOONGSON_GMAC 0x7a03
>>>>    #define PCI_DEVICE_ID_LOONGSON_GNET 0x7a13
>>>> -#define DWMAC_CORE_LS_MULTICHAN      0x10    /* Loongson custom ID */
>>>> -#define CHANNEL_NUM                  8
>>>> +#define DWMAC_CORE_MULTICHAN_V1      0x10    /* Loongson custom ID 0x10 */
>>>> +#define DWMAC_CORE_MULTICHAN_V2      0x12    /* Loongson custom ID 0x12 */
>>>>
>>>>    struct loongson_data {
>>>> +     u32 multichan;
>>> In order to make the logic clearer, I suggest splitting this patch.：
>>>
>>>
>>> 2/4  Add multichan for loongson_data
>>>
>>> 3/4 Add new multi-chan IP core support
>> I don't think the patch is unclear now, the multichan flag is really a
>> combination of DWMAC_CORE_MULTICHAN_V1 and DWMAC_CORE_MULTICHAN_V2.
> OK, please describe this code modification in the commit message.

@Huacai, please extend the commit message, as per Yanteng's request.

Thanks,

Paolo

