Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0713836C
	for <loongarch@lists.linux.dev>; Thu,  9 Feb 2023 01:16:17 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.170])
	by gateway (Coremail) with SMTP id _____8Ax3epaSeRjLDoQAA--.32191S3;
	Thu, 09 Feb 2023 09:16:10 +0800 (CST)
Received: from [10.20.42.170] (unknown [10.20.42.170])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxQuVZSeRjCOQuAA--.54035S3;
	Thu, 09 Feb 2023 09:16:09 +0800 (CST)
Message-ID: <aea24370-2526-7f43-ca5f-55d1d8b8c4bb@loongson.cn>
Date: Thu, 9 Feb 2023 09:16:09 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] LoongArch: add checksum optimization for 64-bit system
To: David Laight <David.Laight@ACULAB.COM>, 'WANG Xuerui'
 <kernel@xen0n.name>, Huacai Chen <chenhuacai@kernel.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20230207040148.1801169-1-maobibo@loongson.cn>
 <8fa91bca5e624861b190917933951c7e@AcuMS.aculab.com>
 <5b3c9b61-7fd5-f50c-32ba-e857090b71bc@xen0n.name>
 <7636a7bebfd44e378c5b16d6fd355232@AcuMS.aculab.com>
Content-Language: en-US
From: maobibo <maobibo@loongson.cn>
In-Reply-To: <7636a7bebfd44e378c5b16d6fd355232@AcuMS.aculab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxQuVZSeRjCOQuAA--.54035S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7AFWktw18uF1UGw45WryfZwb_yoW8Gr1Upr
	1DWay3Ga10q347uwn2yF48Jw15ur43AF45Ja4Yvr1rAFy5XryDJaykGrWjga4Ivr45C3W8
	uFWUtayayr4F9aDanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bxkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64
	kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCF04
	k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
	MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr4
	1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1l
	IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
	A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8zwZ7UUUUU==



在 2023/2/8 22:19, David Laight 写道:
> From: WANG Xuerui
>> Sent: 08 February 2023 13:48
> ...
>> Yeah LoongArch can do rotates, and your suggestion can indeed reduce one
>> insn from every invocation of csum_fold.
>>
>>  From this:
>>
>> 000000000000096c <csum_fold>:
>>          sum += (sum >> 16) | (sum << 16);
>>   96c:   004cc08c        rotri.w         $t0, $a0, 0x10
>>   970:   00101184        add.w           $a0, $t0, $a0
>>          return ~(__force __sum16)(sum >> 16);
>>   974:   0044c084        srli.w          $a0, $a0, 0x10
>>   978:   00141004        nor             $a0, $zero, $a0
>> }
>>   97c:   006f8084        bstrpick.w      $a0, $a0, 0xf, 0x0
>>   980:   4c000020        jirl            $zero, $ra, 0
>>
>> To:
>>
>> 0000000000000984 <csum_fold2>:
>>          return (~sum - rol32(sum, 16)) >> 16;
>>   984:   0014100c        nor             $t0, $zero, $a0
>>          return (x << amt) | (x >> (32 - amt));
>>   988:   004cc084        rotri.w         $a0, $a0, 0x10
>>          return (~sum - rol32(sum, 16)) >> 16;
>>   98c:   00111184        sub.w           $a0, $t0, $a0
>> }
>>   990:   00df4084        bstrpick.d      $a0, $a0, 0x1f, 0x10
>>   994:   4c000020        jirl            $zero, $ra, 0
> 
> It is actually slightly better than that.
> In the csum_fold2 version the first two instructions
> are independent - so can execute in parallel on some cpu.
> 
> 	David
>

Thanks for the good suggestion.
Will send the second version soon.

regards
bibo,mao
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)

