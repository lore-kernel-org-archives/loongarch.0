Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D8C58172E
	for <loongarch@lists.linux.dev>; Tue,  2 Apr 2024 13:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712063222; cv=none; b=nZ+kWBlmPKfu9/YxKHOv5e3moM7hhwEeji9eenVJThKK0stA9ia9YBvls5VEc/PEYKkqiJyAyGYEsBcdoWDBb45QJ2pqsz8w2xrPBxmtZdklFWz6PbhDMKXbxBJC5kF+8KEabKg+2JqwzcoSoALgduWSY3Pu9hSimRcGl253qSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712063222; c=relaxed/simple;
	bh=2pwW/L80mNXkfO0ONij8M4+gNmy+QVEEYfMISxXbzYc=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=RtDUB3KJGoK9N+yBn+Elx26d7Uj0i+nVvElJs+DJa+0B3qoDq6ohPhgIhwtCWb4aS6UaDPyme6cXegWqlhJmz/1//ZC5lhkhSgY6ficmDpbZ7y54scJVOTwztXJnll/b+xgyDW31dljgXy31LriWYOwSqNP9BNypaLsrr/7QE7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.173])
	by gateway (Coremail) with SMTP id _____8AxafDxAgxmHVUiAA--.14007S3;
	Tue, 02 Apr 2024 21:06:58 +0800 (CST)
Received: from [10.20.42.173] (unknown [10.20.42.173])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxCBLuAgxmG9hxAA--.13009S3;
	Tue, 02 Apr 2024 21:06:56 +0800 (CST)
Subject: Re: [PATCH] LoongArch: KVM: Remove useless MODULE macro for
 MODULE_DEVICE_TABLE
To: Wentao Guan <guanwentao@uniontech.com>,
 zhaotianrui <zhaotianrui@loongson.cn>
Cc: loongarch <loongarch@lists.linux.dev>,
 linux-kernel <linux-kernel@vger.kernel.org>, =?UTF-8?B?546L5pix5Yqb?=
 <wangyuli@uniontech.com>
References: <20240402103942.20049-1-guanwentao@uniontech.com>
 <31d39556-79d9-52eb-36aa-5897aea6e28e@loongson.cn>
 <tencent_0ED20EAF678A7C93309EA4F6@qq.com>
From: maobibo <maobibo@loongson.cn>
Message-ID: <2ca6c120-858c-7c52-73c4-71609cd8c10c@loongson.cn>
Date: Tue, 2 Apr 2024 21:06:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <tencent_0ED20EAF678A7C93309EA4F6@qq.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8AxCBLuAgxmG9hxAA--.13009S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUU9ab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x02
	67AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
	I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2
	jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62
	AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI
	1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_Jr
	Wlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j
	6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr
	0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUv
	cSsGvfC2KfnxnUUI43ZEXa7IU8oGQDUUUUU==



On 2024/4/2 下午8:47, Wentao Guan wrote:
> Hello,Bibo,
> 
> I change this that we see other guys use "MODULE_DEVICE_TABLE(cpu,..."
> without use that MODULE macro,and mark cpu_feature struct "__maybe_unused",
> do the same way to avoid unused variable compiler warning  :).

yeap, it looks good to me with __maybe_unused added.

Regards
Bibo Mao
> 
> BRs
> Wentao Guan
> 

