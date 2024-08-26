Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1C6D4EB2B
	for <loongarch@lists.linux.dev>; Mon, 26 Aug 2024 06:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724655302; cv=none; b=pOz9+HlXIQUcL4a79dRn0g39S/CGlzKZ56IsUpOVCOD13OnF3TyW9rH15nFA7G0WgeKQrCC4NUet+ZK9LenGv+dR7xaozOAu+M7h4B408lccK86qxTEee4WO8uUnC8y+svnZBkGulFmy6XPckLSi0ERFfCknsBkWRYDMoQGUYQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724655302; c=relaxed/simple;
	bh=TNAB5I97eN+IOjitMnU+QdfY6Bt4DsWvWrLOVhlZJmw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=dPVkhmAFUaagJ8WljhzhRXciXnshe11BDr5ZNs8/lT6O6IUQ76Mi4X6ogP/y5kfvWBRLfMYk+oJMEgr9dv15aMoO3qFFN7U9+Z/n9wAuaUJus7x3Y5XUJrjuaAXNmNU3V36ytWAPBF/2Lp6QGbMARBH5q+weZ8Lq+xSq6///RFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.4.132])
	by gateway (Coremail) with SMTP id _____8BxrOrDJsxm2yMgAA--.1146S3;
	Mon, 26 Aug 2024 14:54:59 +0800 (CST)
Received: from [10.20.4.132] (unknown [10.20.4.132])
	by front1 (Coremail) with SMTP id qMiowMBxsuHDJsxmGq8iAA--.41059S2;
	Mon, 26 Aug 2024 14:54:59 +0800 (CST)
Message-ID: <fb0ddbe0-8613-40ac-a3fb-9e544c50088d@loongson.cn>
Date: Mon, 26 Aug 2024 14:54:59 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?B?6YOR6LGq5aiB?= <zhenghaowei@loongson.cn>
Subject: Re: [PATCH v3 3/3] LoongArch: Update dts to support Loongson UART
 driver.
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, chenhuacai@kernel.org,
 kernel@xen0n.name, p.zabel@pengutronix.de, linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 loongarch@lists.linux.dev
References: <20240826024705.55474-1-zhenghaowei@loongson.cn>
 <20240826024705.55474-4-zhenghaowei@loongson.cn>
 <gtbaqcnk4g3f4achlyiixu2bbb2rxoxoitbltqxavexjoyqxlf@furbr4zsirkz>
Content-Language: en-US
In-Reply-To: <gtbaqcnk4g3f4achlyiixu2bbb2rxoxoitbltqxavexjoyqxlf@furbr4zsirkz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBxsuHDJsxmGq8iAA--.41059S2
X-CM-SenderInfo: x2kh0w5kdr4v3l6o00pqjv00gofq/1tbiAgEBBGbLHpsHPQAAsU
X-Coremail-Antispam: 1Uk129KBj9xXoWrtw4rtF47ZFWruryxXrW8GrX_yoW3Zrc_KF
	yDKw1qgw18GrWfXw4aq3W3Aa9Ig340y3Z5GrW0vw1S9343tr9Fkr4kAF95ua43WFZF9FWF
	9r1rGw1UCr1fGosvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb78YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAF
	wI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI4
	8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
	wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267
	AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8l38UUUUUU==


在 2024/8/26 14:00, Krzysztof Kozlowski 写道:
> On Mon, Aug 26, 2024 at 10:47:05AM +0800,zhenghaowei@loongson.cn wrote:
>> From: Haowei Zheng<zhenghaowei@loongson.cn>
>>
>> Change to use the Loongson UART driver for Loongson-2K2000,
>> Loongson-2K1000 and Loongson-2K0500.
> Why?
>
> That's what commit msg should explain.  This is not bisectable and
> breaks users without any reasonable need/explanation.
>
> Best regards,
> Krzysztof

I got it, and I will provide detailed explanations like this:

We have provided separate UART drivers for ls2k0500,  ls2k1000, and

ls2k2000, which solves the issue of the full-featured serial port being

unusable. Additionally, we have implemented fractional division

functionality for ls2k2000.


Best regards,

Haowei Zheng

