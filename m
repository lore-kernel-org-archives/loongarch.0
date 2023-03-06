Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 626B43C02
	for <loongarch@lists.linux.dev>; Mon,  6 Mar 2023 12:20:44 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.170])
	by gateway (Coremail) with SMTP id _____8Bx782a2gVktc4IAA--.10999S3;
	Mon, 06 Mar 2023 20:20:42 +0800 (CST)
Received: from [10.20.42.170] (unknown [10.20.42.170])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cxg+WZ2gVkG5VMAA--.34350S3;
	Mon, 06 Mar 2023 20:20:41 +0800 (CST)
Message-ID: <05e692e4-8065-c962-ce5b-d3348fd8574f@loongson.cn>
Date: Mon, 6 Mar 2023 20:20:41 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH V3] LoongArch: Provide kernel fpu functions
Content-Language: en-US
To: Xi Ruoyao <xry111@xry111.site>, Huacai Chen <chenhuacai@loongson.cn>,
 Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, linux-arch@vger.kernel.org,
 Xuefeng Li <lixuefeng@loongson.cn>, Guo Ren <guoren@kernel.org>,
 Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
References: <20230306095934.609589-1-chenhuacai@loongson.cn>
 <029a5993-b993-ab73-0a14-0df9b0ddf3da@loongson.cn>
 <95273478173af301f3b63b9be2559213e4f29fb8.camel@xry111.site>
From: maobibo <maobibo@loongson.cn>
In-Reply-To: <95273478173af301f3b63b9be2559213e4f29fb8.camel@xry111.site>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Cxg+WZ2gVkG5VMAA--.34350S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvdXoWrKFWrXFW5Aw15KF4xXF43Wrg_yoWxAFX_ur
	yDurs3C347AryIq3yDAw4fZayfKayDJry0y340grW3Zw4UZFWDGFs5Xas3J3ZrXayrua9a
	93yjgrsakF4jkjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
	xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
	v7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
	AFIxvE14AKwVWUGVWUXwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
	6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7
	xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr0_GcWle2I2
	62IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4
	CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F4UMcvj
	eVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487MxAIw2
	8IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1q6r43MI8I
	3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxV
	WUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8I
	cVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aV
	AFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZE
	Xa7IU8yrW7UUUUU==



在 2023/3/6 20:09, Xi Ruoyao 写道:
> On Mon, 2023-03-06 at 20:03 +0800, maobibo wrote:
>> 在 2023/3/6 17:59, Huacai Chen 写道:
>>> Provide kernel_fpu_begin()/kernel_fpu_end() to allow the kernel itself
>>> to use fpu. They can be used by some other kernel components, e.g., the
>>> AMDGPU graphic driver for DCN.
>> Since kernel is compiled with -msoft-float, I guess hw fpu will not be
>> used in kernel by present:). However it is deserved to try.
> 
> See the draft AMD DCN support patch:
> https://github.com/loongson/linux/commit/0ee299095c963938a7626c3121a8feef32251301
Got it, thanks for pointing it out, good job:)

Regards
Bibo,Mao
> 

