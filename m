Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C5AE30E83F
	for <loongarch@lists.linux.dev>; Wed, 27 May 2026 06:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779862504; cv=none; b=PizR5fmp5NBmlxjq5O5elbSiS3Zt0UOzXoYz3m24Hn8WnbMBVc7/pUptI7XvSGjx44q9zU/50ENtd1xA895ulDi1LBp7uexjKwsMmCayM7MGBbMbW+AM0/P27sHtI/TtpMxnL6rwxH4IpGNnii0s9EakxgitSNvD4oeW62Lkqj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779862504; c=relaxed/simple;
	bh=YiFPYRDMN91GJeH0MRR4xomTzcDL9Jdeh4UjlW+B/04=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=g7fuJmfPsWOKL4+wKM/M3NnTFCTfHjy5apwEOwyxV2pCi4ll9OWqfbn0Da2cwnmqh+BghH+wUiIpvVvxYAYPJGBrkxpMA0ikIvdxRnf+y2QVCqmF+iPcGyNH7g9nfUqtLjTF/F/qJ6HiJ+jxhz9M0BniY69shlkrfQCP1+oxJ7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.101])
	by gateway (Coremail) with SMTP id _____8DxsOrdixZqcqsNAA--.38962S3;
	Wed, 27 May 2026 14:14:53 +0800 (CST)
Received: from [10.20.42.101] (unknown [10.20.42.101])
	by front1 (Coremail) with SMTP id qMiowJDxD8PUixZq7nqSAA--.15419S3;
	Wed, 27 May 2026 14:14:53 +0800 (CST)
Subject: Re: [PATCH v4 1/2] dt-bindings: i2c: ls2x-i2c: Add clocks and
 clock-frequency properties
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, loongarch@lists.linux.dev
References: <20260526031021.32662-1-wanghongliang@loongson.cn>
 <20260526031021.32662-2-wanghongliang@loongson.cn>
 <20260526-inquisitive-sambar-of-wholeness-22f99d@quoll>
From: Hongliang Wang <wanghongliang@loongson.cn>
Message-ID: <bdbabe6f-1756-c812-fe1e-2aaedf925796@loongson.cn>
Date: Wed, 27 May 2026 14:13:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260526-inquisitive-sambar-of-wholeness-22f99d@quoll>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qMiowJDxD8PUixZq7nqSAA--.15419S3
X-CM-SenderInfo: pzdqwxxrqjzxhdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrZrWUZFyrKrW8Jw1rKFykJFc_yoWfKrc_JF
	Wjyr409r9ayFn5u3s8tF1UZrW2q34DCr4UZF1xAF1SkF98tas8AF9rW3Z5Zw47ZFW2g34f
	WrnYyw1rC343uosvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbxxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8
	JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67
	vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
	wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc4
	0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
	xVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
	1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUrNtxDUUU
	U

Hi, Krzysztof

On 2026/5/26 下午11:03, Krzysztof Kozlowski wrote:
> On Tue, May 26, 2026 at 11:10:20AM +0800, Hongliang Wang wrote:
>> From: wanghongliang <wanghongliang@loongson.cn>
>>
>> clocks property describes the i2c bus reference clock from APB clock.
>> clock-frequency property describes i2c bus speed.
> Not rally relevant to your code. We know what clocks and clock-frequency
> are.

OK, I will delete these irrelevant descriptions and add appropriate ones.

The modify is as below:

add clocks and clock-frequency properties to examples.

>> Signed-off-by: wanghongliang <wanghongliang@loongson.cn>
> Please do not use login name as actual name. Your email has different
> Latin transcription than above.
OK, I will modify this issue.
>> ---
>>   Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml | 3 +++
>>   1 file changed, 3 insertions(+)
> Best regards,
> Krzysztof

Best regards,

Hongliang Wang

