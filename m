Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 106A84A24
	for <loongarch@lists.linux.dev>; Tue, 18 Oct 2022 11:52:35 +0000 (UTC)
Received: from loongson.cn (unknown [10.90.50.23])
	by gateway (Coremail) with SMTP id _____8Dxu9hckk5jDmcAAA--.2376S3;
	Tue, 18 Oct 2022 19:47:41 +0800 (CST)
Received: from [10.90.50.23] (unknown [10.90.50.23])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Dx_eFbkk5jSKkAAA--.2752S3;
	Tue, 18 Oct 2022 19:47:39 +0800 (CST)
Message-ID: <9210a23b-b9cb-24dc-bb5d-6f45caf8d193@loongson.cn>
Date: Tue, 18 Oct 2022 19:47:39 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 1/2] Documentation: LoongArch: Document the syscall ABI
To: Xi Ruoyao <xry111@xry111.site>
Cc: WANG Xuerui <git@xen0n.name>, Huacai Chen <chenhuacai@kernel.org>,
 Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 loongarch@lists.linux.dev
References: <20221018100457.3440691-1-kernel@xen0n.name>
 <20221018100457.3440691-2-kernel@xen0n.name>
 <3df303d1b0196a62217f6d034c0375855d77e04b.camel@xry111.site>
Content-Language: en-US
From: Qi Hu <huqi@loongson.cn>
In-Reply-To: <3df303d1b0196a62217f6d034c0375855d77e04b.camel@xry111.site>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8Dx_eFbkk5jSKkAAA--.2752S3
X-CM-SenderInfo: pkxtxqxorr0wxvrqhubq/1tbiAQADCWNNReEbvwABsk
X-Coremail-Antispam: 1Uk129KBjvdXoW7XrW8Cw15urWUGF4xury5XFb_yoW3XFX_ur
	s7Ar1fJws3Jw4aga1qqrZxGrZxGa90kFyYka45Jr43W34DXa4xAw4Skry7CF43G3yIq39x
	AryYgryxA347ujkaLaAFLSUrUUUU0b8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
	xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUO
	07kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
	AFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
	6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7
	xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAa
	w2AFwI0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
	I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2
	jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62
	AI1cAE67vIY487MxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCa
	FVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2
	IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI
	42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42
	IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280
	aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU7-B_UUUUU


On 2022/10/18 18:12, Xi Ruoyao wrote:
> On Tue, 2022-10-18 at 18:04 +0800, WANG Xuerui wrote:
>
> /* snip */
>
>
>> +The system call number is placed in the register ``a7``.
>> +Parameters, if present, are placed from ``a0`` through ``a6`` as needed,
>> +as if calling a function with the respective arguments.
>> +Upon return, ``a0`` contains the return value, and ``t0-t8`` should be
>> +considered clobbered; all other registers are preserved.
> Hmm, are a1-a7 guaranteed to be preserved?
>
Yes, you can find the relevant code here: [1] [2].

Thanks.


[1]: 
https://github.com/torvalds/linux/blob/master/arch/loongarch/kernel/entry.S#L43-L50

[2]: 
https://github.com/torvalds/linux/blob/master/arch/loongarch/kernel/entry.S#L68

