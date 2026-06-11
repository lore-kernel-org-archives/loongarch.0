Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B573D1F5825
	for <loongarch@lists.linux.dev>; Thu, 11 Jun 2026 06:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781159276; cv=none; b=tkZncURAr9btvEPpi4qYglVQGu1LqolBmOY1ekTi+2O/oDu0HcVPLromIIHQfJv/1AvsPXCgsKtUkANYxBUc74tWYTYIzyhMg7h9a/NeqXhi06yck4PyZWxrO/h3Fx4t7H6oSRX5t/+RD3CBNMR7WL1rBUDDUs73Y8LyK2PeXBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781159276; c=relaxed/simple;
	bh=UYi8BwyYloZReA6nUvi9c7vHBAf7l/NYvXumqcxt0SQ=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=a3wt5SvvrmXcCvsNHjLFiODwDwFYb2cmrsb1/vaXbn7QPaQwachwOEYYsOc8ciOTXoaYC4nqvKuSG3znKp6/udBoIpEsll0RBvsMlS7W8xxQAXqzDut1GibsVNovtlS2YyYmLGLown1ERj/pPjALL51dU+Yi6dawSfo5wCGN+bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxJelmVSpqcPkSAA--.44109S3;
	Thu, 11 Jun 2026 14:27:50 +0800 (CST)
Received: from [10.130.40.83] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJBxLMJkVSpqzKGiAA--.45733S3;
	Thu, 11 Jun 2026 14:27:49 +0800 (CST)
Subject: Re: [PATCH v3] LoongArch: Enable STRICT_MODULE_RWX for stricter
 modules memory permissions
To: Huacai Chen <chenhuacai@kernel.org>, haoran.jiang@linux.dev
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 kernel@xen0n.name, akpm@linux-foundation.org, jbohac@suse.cz,
 kees@kernel.org, Haoran Jiang <jianghaoran@kylinos.cn>
References: <20260608063857.291340-1-haoran.jiang@linux.dev>
 <CAAhV-H762twrT91Bxq64hLcbG9s78EO+cOdLhWQ3FbW+he36pg@mail.gmail.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <9a8de97c-0c61-3e0a-d4c7-598770a4ca70@loongson.cn>
Date: Thu, 11 Jun 2026 14:27:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H762twrT91Bxq64hLcbG9s78EO+cOdLhWQ3FbW+he36pg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxLMJkVSpqzKGiAA--.45733S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrZr48AFyDZw48WrWUZr1kZwc_yoW3Arc_Ww
	48uF9293y8C3ZxuanFkrn8uw1ktF1kCr40q3yUAw12vw17Jr9xCF47uFWvvwsrta93W343
	uFsaqanYvryUZosvyTuYvTs0mTUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbS8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y
	6r17McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
	1lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26c
	xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jFa0PUUUUU=

On 2026/6/9 下午4:33, Huacai Chen wrote:
> Hi, Haoran,
> 
> On Mon, Jun 8, 2026 at 2:39 PM <haoran.jiang@linux.dev> wrote:
>>
>> From: Haoran Jiang <jianghaoran@kylinos.cn>
>>
>> Enable STRICT_MODULE_RWX to enforce strict memory permissions
>> on modules,making the code region non-writable, the data region
>> non-executable, and the read-only data region both non-writable
>> and non-executable.Temporarily modify code section read/write
>> permissions via set_memory() API.

...

> In addition, it seems that text_mutex and patch_lock are for the same
> purpose, so patch_lock can be removed here.
> 
> @Tiezhu, what's your opinion?

Agreed. If all callers properly switch to text_mutex, patch_lock can be
removed entirely.

Thanks,
Tiezhu

