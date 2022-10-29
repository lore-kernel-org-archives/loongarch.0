Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 971A515B3
	for <loongarch@lists.linux.dev>; Sat, 29 Oct 2022 02:54:12 +0000 (UTC)
Received: from loongson.cn (unknown [10.180.13.64])
	by gateway (Coremail) with SMTP id _____8DxC7bSlVxjzzYDAA--.342S3;
	Sat, 29 Oct 2022 10:54:10 +0800 (CST)
Received: from [10.180.13.64] (unknown [10.180.13.64])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxNlfSlVxjXKYGAA--.4822S2;
	Sat, 29 Oct 2022 10:54:10 +0800 (CST)
Subject: Re: [PATCH v5 1/3] dt-bindings: clock: add loongson-2 clock include
 file
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Jianmin Lv <lvjianmin@loongson.cn>,
 Yang Li <yang.lee@linux.alibaba.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev
References: <20221028025504.13247-1-zhuyinbo@loongson.cn>
 <01a38c4c-b42a-c170-3c3d-0b7e087bfaa4@linaro.org>
From: Yinbo Zhu <zhuyinbo@loongson.cn>
Message-ID: <2bd0f05d-a5c4-3c5c-ccbc-3e3385cc0a1d@loongson.cn>
Date: Sat, 29 Oct 2022 10:54:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <01a38c4c-b42a-c170-3c3d-0b7e087bfaa4@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxNlfSlVxjXKYGAA--.4822S2
X-CM-SenderInfo: 52kx5xhqerqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvdXoWrJFy8JrW7ZF4fAry3WF4fuFg_yoWxWrXEkF
	WIyw1DZw13GrZ3KanYqFyDCaySg34jy3yUKFZYqr4fXa4UtrWjvr48C3s3KrW3WrsFgr4r
	ury8tw1xCw1fujkaLaAFLSUrUUUU8b8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
	xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUO
	j7CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2
	IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84AC
	jcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84
	ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8I
	j28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2
	WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkE
	bVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487MxkF7I0En4kS14v26r
	126r1DMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_WwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E74
	80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0
	I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04
	k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7Cj
	xVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07joKZXUUUUU=



在 2022/10/28 下午7:43, Krzysztof Kozlowski 写道:
> On 27/10/2022 22:55, Yinbo Zhu wrote:
>> This file defines all Loongson-2 SoC clock indexes, it should be
>> included in the device tree in which there's device using the
>> clocks.
>>
>> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>> Change in v5:
>> 		1. Replace loongson2/Loongson2 with loongson-2/Loongson-2.
>> 		2. Replace soc with SoC.
>>
> 
> Where is the rest of the changelog?
What you're asking is where the replacement string is located.  it was 
in commit log.
> 
> Best regards,
> Krzysztof
> 

