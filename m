Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 361F16AB1
	for <loongarch@lists.linux.dev>; Wed,  9 Nov 2022 09:41:23 +0000 (UTC)
Received: from loongson.cn (unknown [10.180.13.64])
	by gateway (Coremail) with SMTP id _____8CxfbbDdWtj14UFAA--.6094S3;
	Wed, 09 Nov 2022 17:41:23 +0800 (CST)
Received: from [10.180.13.64] (unknown [10.180.13.64])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxDuLBdWtjYXwPAA--.42778S2;
	Wed, 09 Nov 2022 17:41:22 +0800 (CST)
Subject: Re: [PATCH v8 2/2] dt-bindings: hpet: add loongson-2 hpet
From: Yinbo Zhu <zhuyinbo@loongson.cn>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Jianmin Lv <lvjianmin@loongson.cn>,
 Yun Liu <liuyun@loongson.cn>, Yang Li <yang.lee@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 loongarch@lists.linux.dev
References: <20221103065351.32603-1-zhuyinbo@loongson.cn>
 <20221103065351.32603-2-zhuyinbo@loongson.cn>
 <b0aed9f8-f82e-3d74-4299-4d77445c2170@loongson.cn>
 <a588a90e-a8ab-7b43-a14b-101bb9f590db@linaro.org>
 <b20098b3-e833-7412-143e-4f39d344ff67@loongson.cn>
Message-ID: <b0e18583-24d2-73c4-8d80-d06d2cd4824d@loongson.cn>
Date: Wed, 9 Nov 2022 17:41:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <b20098b3-e833-7412-143e-4f39d344ff67@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8AxDuLBdWtjYXwPAA--.42778S2
X-CM-SenderInfo: 52kx5xhqerqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvdXoW7XFy3tw47AF4rGrWftry5urg_yoW3ArX_Xa
	4qk3s3uF47uFyvqFs7tF9xu3srK3s8Jry8JrWrX3y3Wws0yrWDAws3G34Sv3WYqFWfCFnx
	Cryqqw4ruFsIgjkaLaAFLSUrUUUU0b8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
	xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUO
	n7CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2
	IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84AC
	jcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM2
	8EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1UM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE
	52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I
	80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE
	7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487MxkF7I0En4kS14
	v26r126r1DMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_WwCFx2IqxVCFs4IE
	7xkEbVWUJVW8JwCFI7km07C267AKxVW8ZVWrXwC20s026c02F40E14v26r1j6r18MI8I3I
	0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAI
	cVC0I7IYx2IY67AKxVW5JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcV
	CF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY6I8E87Iv
	6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU1_cTJUUUUU==

sorry, please ignore this ping in v8.

在 2022/11/9 下午5:38, Yinbo Zhu 写道:
> 
> 
> 在 2022/11/9 下午5:24, Krzysztof Kozlowski 写道:
>> On 09/11/2022 10:19, Yinbo Zhu wrote:
>>> Hi maintainer,
>>>
>>> please help me merge it to upstream.
>>> in addition, this patch need rely on
>>> "https://patchwork.kernel.org/project/linux-clk/list/?series=691497"
>>
>> Why pinging for v8? Didn't you have v9 and v10?
>>
>> Several of your Loongson patches had many build errors, pointed out by
>> lkp. Therefore I have doubts that you test these extensively. This might
>> be the reason why your patches float around...
>>
>> Best regards,
>> Krzysztof
> Yes, thanks your remind.
> and I have a compile test and function test about hpet in mainline linux 
> tree 6.1-rc3.
>>

