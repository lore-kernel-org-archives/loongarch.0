Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 278FA1378
	for <loongarch@lists.linux.dev>; Fri, 16 Dec 2022 09:33:13 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Dx_+tSO5xjehAGAA--.13874S3;
	Fri, 16 Dec 2022 17:33:06 +0800 (CST)
Received: from [10.130.0.135] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxHuRQO5xj1FwBAA--.3730S3;
	Fri, 16 Dec 2022 17:33:04 +0800 (CST)
Subject: Re: [PATCH v10 2/4] LoongArch: Add kprobe support
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
References: <1670575981-14389-1-git-send-email-yangtiezhu@loongson.cn>
 <1670575981-14389-3-git-send-email-yangtiezhu@loongson.cn>
 <20221214162847.1f9481fd2cf5212657a0fd58@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <0a135b50-ca96-8ee1-6f33-29efcdb256ed@loongson.cn>
Date: Fri, 16 Dec 2022 17:33:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20221214162847.1f9481fd2cf5212657a0fd58@kernel.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8AxHuRQO5xj1FwBAA--.3730S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvdXoWrtw4ruF4DGF1kZr1kGFyfWFg_yoWkKwbE93
	WfJrn7G348JF4UG3WFgr4rZF1DWayUGF9Yy34FvrZ3Aa45Jw4fWrs7Cwn0yF15JrZ7CFZI
	krs8XF1kZryavjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
	xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
	47kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
	AFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
	6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7
	xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64
	kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCF04
	k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
	MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr4
	1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1l
	IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
	A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU82-e7UUUUU==



On 12/14/2022 03:28 PM, Masami Hiramatsu (Google) wrote:
> Hi,
>
> On Fri,  9 Dec 2022 16:52:59 +0800
> Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>
>> Kprobes allows you to trap at almost any kernel address and
>> execute a callback function, this commit adds kprobe support
>> for LoongArch.

...

>> +	case KPROBE_HIT_ACTIVE:
>> +	case KPROBE_HIT_SSDONE:
>
> Recently, I removed these cases because this page fault will be finally
> handled by the generic pagefault handler.
>

Hi Masami,

I have addressed all your comments on my local machine, the code logic
looks much more clear now, thank you very much.

When I test kprobe_example.ko with a C function like "kernel_clone",
it works well, but the kernel hangs [1] when test with an assembler
function like "__memset_fast" [2].

Just did some quick research and it seems the bug is related with
kallsyms_lookup_name(), I'm looking for a solution.

[1] 
https://lore.kernel.org/loongarch/CAEr6+EC2wPAtK8zb3=e1mUiya3gv0UhqF9J_ySYx9p_96pB+tg@mail.gmail.com/
[2] 
https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git/tree/arch/loongarch/lib/memset.S?h=loongarch-next#n56

Thanks,
Tiezhu

