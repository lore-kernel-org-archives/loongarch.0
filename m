Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42F4982863
	for <loongarch@lists.linux.dev>; Wed,  7 Aug 2024 08:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723019020; cv=none; b=dRf5XQDLc5Lbins07WJqtb8vNLWIlG4pcjG/TdoEA/qIclx13dRzEph4Ldk12Erkb4OS8O7Tp/HC8UJzA9JYoTGBWzGA2yjWAm1w9UhzhW3k5gKxl9uw5w5AuDBRepYNQOqXmiQJJ5MY11Oo5uovC6Bu115dv7byMOwzj8CMW/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723019020; c=relaxed/simple;
	bh=cfIpmgiI5x0yn2PAOj2m02+n6eZ7sC+4EZ8CMsWZ2c8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=bjznmF9BN7unkDctRraj93vtJI88Iss+1OulFgt+AweLmAwyMttI0/PKPzWP9mGAtxfIskMhZ49C39bxh4SD/MvmksUv0WYl247jq+hX2B9VQrV7qTIbiePE0Z40+BR3M2KIH4kKbpi6mguM0kfEsM8WuUnNl4/fHSQAJugIUcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.4.132])
	by gateway (Coremail) with SMTP id _____8BxqOkIL7NmwSYKAA--.30277S3;
	Wed, 07 Aug 2024 16:23:36 +0800 (CST)
Received: from [10.20.4.132] (unknown [10.20.4.132])
	by front1 (Coremail) with SMTP id qMiowMDx_2cIL7NmJrUHAA--.10741S2;
	Wed, 07 Aug 2024 16:23:36 +0800 (CST)
Message-ID: <fe8c919a-766b-4eb7-853c-19a14341018e@loongson.cn>
Date: Wed, 7 Aug 2024 16:23:36 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?B?6YOR6LGq5aiB?= <zhenghaowei@loongson.cn>
Subject: Re: [PATCH v2 1/3] dt-bindings: serial: Add Loongson UART controller
To: Krzysztof Kozlowski <krzk@kernel.org>, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name,
 p.zabel@pengutronix.de
Cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, loongarch@lists.linux.dev
References: <20240804063834.70022-1-zhenghaowei@loongson.cn>
 <8aeb4071-3609-4f89-abc7-5b8328dc4290@kernel.org>
Content-Language: en-US
In-Reply-To: <8aeb4071-3609-4f89-abc7-5b8328dc4290@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMDx_2cIL7NmJrUHAA--.10741S2
X-CM-SenderInfo: x2kh0w5kdr4v3l6o00pqjv00gofq/1tbiAgECBGayEhgQoAABsq
X-Coremail-Antispam: 1Uk129KBj9xXoW7Gw47AF1rtr1Utw43WrWDKFX_yoWxZFX_GF
	9Fyw4vgr1ktFWrA3Z8XF4kJry3uayj934DuayYyr1Iv3s0vFy5Jry0yryfWF4fJFZ0kF9a
	9rWkWFnYyr43uosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7xYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07josjUUUUUU=


在 2024/8/4 16:41, Krzysztof Kozlowski 写道:
> On 04/08/2024 08:38,zhenghaowei@loongson.cn wrote:
>> From: Haowei Zheng<zhenghaowei@loongson.cn>
>>
>> Add Loongson UART controller binding with DT schema format using
>> json-schema.
>>
> Where is the changelog? Are you sending the same patch again?
>
> Best regards,
> Krzysztof

Sorry, here are the change log from V1 to V2, and I will include the update

in the next patch update.

Changes in V2:

- Correct the schema formatting errors.

- file name changed from 'loongson-uart.yaml' to 'loongson,ls7a-uart.yaml'

- Replace 'loongson,loongson-uart' with 'loongson,ls7a-uart'.


Best regards,

Haowei Zheng

