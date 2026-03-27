Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E790313540
	for <loongarch@lists.linux.dev>; Fri, 27 Mar 2026 02:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774577322; cv=none; b=XNYPx/U2BItZO17DwpEmFOCUyNVzrJKRvF9yy45Gf7/gZZaatHc6NH6LpfjLSbL8aEm434tzd/Ww8XcUesck3cXv/opmXvHxIDaIBNUuoiJRSKI3P/KELLf1qSrrwVu+CSwkOFeq1tovCwBApcLl3lP3j/gybHBn5P3LpSMuCGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774577322; c=relaxed/simple;
	bh=arflJ345y4z11eLr1mhaninN4JmK9mNofoij919V/ds=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=DwQYZrQ4834u5ECYa2PUyrVFKwVfNGTTtkvIsTdNnOytJCZlOdIVHIYdvMci5FIIf8EOyesFLK/3t/eKX/k5a+McYx7dczoPleyFukZ3PbAR4v2heErtbDgtLwVy+3ibVhfEKUrBzV2k+um/r2WdbP10IBLxBDMnZBCgpsGWdHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.101])
	by gateway (Coremail) with SMTP id _____8CxqsKh5sVp4iQfAA--.22710S3;
	Fri, 27 Mar 2026 10:08:33 +0800 (CST)
Received: from [10.20.42.101] (unknown [10.20.42.101])
	by front1 (Coremail) with SMTP id qMiowJBxacGg5sVpj3VeAA--.35763S3;
	Fri, 27 Mar 2026 10:08:32 +0800 (CST)
Subject: Re: [PATCH v1 1/2] dt-bindings: i2c: ls2x-i2c: Add clock- related
 properties
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Binbin Zhou <zhoubinbin@loongson.cn>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, loongarch@lists.linux.dev
References: <20260325011852.19079-1-wanghongliang@loongson.cn>
 <20260325011852.19079-2-wanghongliang@loongson.cn>
 <20260325-outstanding-weasel-of-fruition-89db37@quoll>
 <1b5283d8-294c-86de-c3d8-bf205ac24216@loongson.cn>
 <acTeJvyLty4K9kFn@zenone.zhora.eu>
From: Hongliang Wang <wanghongliang@loongson.cn>
Message-ID: <133faae3-7a74-6b77-7c1b-09e12d480ad7@loongson.cn>
Date: Fri, 27 Mar 2026 10:08:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <acTeJvyLty4K9kFn@zenone.zhora.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qMiowJBxacGg5sVpj3VeAA--.35763S3
X-CM-SenderInfo: pzdqwxxrqjzxhdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrKr4kJr43Jw4xWFyDKr17urX_yoW3trX_ua
	4v9w1Ut3W8Ga9xtrnrKr45Ja13ta4UGry2gr1kAa48G3s3XF4DCa4vvry8W3WjqrW0qw17
	Crn29w18ZrnxuosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb3AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8
	JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67
	vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v2
	6r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
	CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF
	0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIx
	AIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIev
	Ja73UjIFyTuYvjxU2nYFDUUUU


On 2026/3/26 下午3:21, Andi Shyti wrote:
> Hi Hongliang,
>
>> Consider the clock framework relies on the device tree, and can only be used
>> on
>> Loongson 2K platform with dts parameter mechanism, It cannot be used on
>> Loongson
>> 3A+7A platform with the acpi parameter mechanism.
>> The i2c-ls2x driver is compatible with both Loongson 2K and 3A+7A platform,
>> parse
>> the same parameters regardless of dts or acpi parameter passing, So
>> clock-input
>> and clock-div attributes are defined to describe input clock of i2c
>> controller and
>> divisor of input clock. It can be used on both 2K and 3A+7A platform.
> Thanks for the explanation, but please do consider Krzysztof's
> review. Without him agreeing on the change I can't take your
> patch.
>
> If you have questions, please ask.
OK, thank you
> Andi

