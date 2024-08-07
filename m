Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58F0F1392
	for <loongarch@lists.linux.dev>; Wed,  7 Aug 2024 08:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723019010; cv=none; b=iEI4i2+eZqDIFdYNtgv3lSJchBXGX/b+zOlGc+TZYdnJeSkkVsWh0FouRMfjfLSm0yakpsugkIOx05r9XG+LsIz6Xdc6bYrjlqUR+j9DeePXnCpdtJthj93iryVNZSZ0VRpDqdJwQRZQxoUKTwDSGzl7PjIAXu/dSMXWUhoeAhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723019010; c=relaxed/simple;
	bh=bVpeD1TPk0eLXfpcVNkzHFDlsmDXfNiXac3DR+ChgkU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=HHLwjBy87KX0js4dTgot8Xve4ofvUYDCnVVgwQ3UKqFIu5kAF4jpth3aCbwhGmJC3v00gaLRsEjAPxC/Wv+Ua1YqrrFejoBGi9ENNImKRm/ia/bVl3gUHorR/3QwdNOZwVKjMFG0RRGiQ2A43ZHJY2IJK43OyRk6/n6ycCZdCWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.4.132])
	by gateway (Coremail) with SMTP id _____8AxGur_LrNmoSYKAA--.31792S3;
	Wed, 07 Aug 2024 16:23:27 +0800 (CST)
Received: from [10.20.4.132] (unknown [10.20.4.132])
	by front1 (Coremail) with SMTP id qMiowMBxsuH+LrNmGrUHAA--.10863S2;
	Wed, 07 Aug 2024 16:23:26 +0800 (CST)
Message-ID: <3b4f94d4-51f6-45ad-be22-52be0f5e39d6@loongson.cn>
Date: Wed, 7 Aug 2024 16:23:26 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?B?6YOR6LGq5aiB?= <zhenghaowei@loongson.cn>
Subject: Re: [PATCH v2 3/3] LoongArch: dts: Update UART driver to
 Loongson-2K0500, Loongson-2K1000 and Loongson-2K2000.
To: Krzysztof Kozlowski <krzk@kernel.org>, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name,
 p.zabel@pengutronix.de
Cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, loongarch@lists.linux.dev
References: <20240804063834.70022-1-zhenghaowei@loongson.cn>
 <20240804063834.70022-3-zhenghaowei@loongson.cn>
 <bf6fbb80-95f5-4c9c-b7d4-dd7f432056c7@kernel.org>
Content-Language: en-US
In-Reply-To: <bf6fbb80-95f5-4c9c-b7d4-dd7f432056c7@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBxsuH+LrNmGrUHAA--.10863S2
X-CM-SenderInfo: x2kh0w5kdr4v3l6o00pqjv00gofq/1tbiAQECBGayEXMQJQABsE
X-Coremail-Antispam: 1Uk129KBj9xXoWrWF17tF4xXF13Zr18Ww1rAFc_yoWxGFg_XF
	9Fyws293WkJrWrWwnIqFnrZr1avw1UXwnrCrs5Kr17Zw1UKFW5CFyDAryrGrW3uFWDKryr
	Gr4kWF18AF43ZosvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7xYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j0byZUUUUU=


在 2024/8/4 16:40, Krzysztof Kozlowski 写道:
> On 04/08/2024 08:38,zhenghaowei@loongson.cn wrote:
>> From: Haowei Zheng<zhenghaowei@loongson.cn>
>>
>> Change to use the Loongson UART driver by default.
>>
>> Signed-off-by: Haowei Zheng<zhenghaowei@loongson.cn>
> No changelog? Nothing improved?
>
> Best regards,
> Krzysztof

Sorry , I will include the update from V1 to V2 in the next patch update.

Here is the content of the update from V1 to V2:

Changes in V2:

- The compatible property for the UART is changed from "ns16650,loongson"

    to "loongson,ls7a-uart".


Best regards,

Haowei Zheng

