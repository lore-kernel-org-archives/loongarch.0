Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 271ED14F78
	for <loongarch@lists.linux.dev>; Mon, 18 Dec 2023 10:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.112.193])
	by gateway (Coremail) with SMTP id _____8DxyehOHYBlXAgCAA--.10699S3;
	Mon, 18 Dec 2023 18:22:06 +0800 (CST)
Received: from [192.168.100.8] (unknown [112.20.112.193])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxCHNMHYBlMBIKAA--.32567S3;
	Mon, 18 Dec 2023 18:22:06 +0800 (CST)
Message-ID: <033fedc9-1d96-408e-911b-9829c6a5e851@loongson.cn>
Date: Mon, 18 Dec 2023 18:22:04 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/9] net: stmmac: Add Loongson-specific register
 definitions
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
Cc: hkallweit1@gmail.com, peppe.cavallaro@st.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, fancer.lancer@gmail.com,
 Jose.Abreu@synopsys.com, chenhuacai@loongson.cn, linux@armlinux.org.uk,
 guyinggang@loongson.cn, netdev@vger.kernel.org, loongarch@lists.linux.dev,
 chris.chenfeiyang@gmail.com
References: <cover.1702458672.git.siyanteng@loongson.cn>
 <40eff8db93b02599f00a156b07a0dcdacfc0fbf3.1702458672.git.siyanteng@loongson.cn>
 <8a7d2d11-a299-42e0-960f-a6916e9b54fe@lunn.ch>
From: Yanteng Si <siyanteng@loongson.cn>
In-Reply-To: <8a7d2d11-a299-42e0-960f-a6916e9b54fe@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxCHNMHYBlMBIKAA--.32567S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj9xXoWrKrWrJF47WFyfuw4DKw47KFX_yoWDZrX_Kr
	yF9w1kCr4DKrnFkF4UKrW5Zr1q9FZ7ZrW0gr1FqwsYv343Ja4xGFW8GryFva48Wr1jvFn8
	Cw17tF4DG3yagosvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
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
	IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07josjUUUUUU=


在 2023/12/16 23:47, Andrew Lunn 写道:
> On Wed, Dec 13, 2023 at 06:14:23PM +0800, Yanteng Si wrote:
>> There are two types of Loongson DWGMAC. The first type shares the same
>> register definitions and has similar logic as dwmac1000. The second type
>> uses several different register definitions.
>>
>> Simply put, we split some single bit fields into double bits fileds:
>>
>> DMA_INTR_ENA_NIE = 0x00040000 + 0x00020000
>> DMA_INTR_ENA_AIE = 0x00010000 + 0x00008000
>> DMA_STATUS_NIS = 0x00040000 + 0x00020000
>> DMA_STATUS_AIS = 0x00010000 + 0x00008000
>> DMA_STATUS_FBI = 0x00002000 + 0x00001000
> What is missing here is why? What are the second bits used for? And

We think it is necessary to distinguish rx and tx, so we split these 
bits into two.

this is:

DMA_INTR_ENA_NIE = rx + tx

> why does the driver not care which bit is set when handing interrupts?

We will care about it later. Because now we will support the minimum 
feature set

first, which can reduce everyone’s review pressure.


Thanks,

Yanteng

>
>      Andrew

