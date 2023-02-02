Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 235FF816
	for <loongarch@lists.linux.dev>; Thu,  2 Feb 2023 02:23:21 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Cx+emSHttjh_0LAA--.24404S3;
	Thu, 02 Feb 2023 10:23:14 +0800 (CST)
Received: from [10.130.0.135] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cx2r2RHttjD_AmAA--.10846S3;
	Thu, 02 Feb 2023 10:23:14 +0800 (CST)
Subject: Re: [PATCH v12 0/5] Add kprobe and kretprobe support for LoongArch
To: Jeff Xie <xiehuan09@gmail.com>, Huacai Chen <chenhuacai@kernel.org>
References: <1674007261-9198-1-git-send-email-yangtiezhu@loongson.cn>
 <CAAhV-H4aTd6_cSy45KKjv-KrLTiwT4iG6+fkb84KfCrL3Y+hpg@mail.gmail.com>
 <CAAhV-H5WN5E=0Z9wpbXDc6VO7Nc+j7PGvnyAAGOmCRMJkdwSYw@mail.gmail.com>
 <CAEr6+ECO-=jfhzHrcdKGx0MsjMBMiN6wsBPCfv7CaXo_amAWWg@mail.gmail.com>
Cc: WANG Xuerui <kernel@xen0n.name>, Masami Hiramatsu <mhiramat@kernel.org>,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <02806f85-bc09-d316-f058-3947353cb190@loongson.cn>
Date: Thu, 2 Feb 2023 10:23:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAEr6+ECO-=jfhzHrcdKGx0MsjMBMiN6wsBPCfv7CaXo_amAWWg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8Cx2r2RHttjD_AmAA--.10846S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxWryxKr1xKFWrtrWkArWkWFg_yoW5XF47pF
	Z2k3W5KrW0g34UZrZru3y8Xryj9r45uFyUJrZ3J34Y9FyDZr18Xr12kay0yF9rur1YqF4a
	vay8Jay0kFyUX3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bI8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2
	IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487Mx
	AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
	Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwI
	xGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8
	JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
	C2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU25EfUUUUU



On 02/01/2023 05:40 PM, Jeff Xie wrote:
> On Wed, Feb 1, 2023 at 12:56 PM Huacai Chen <chenhuacai@kernel.org> wrote:
>>
>> Hi, Jeff,
>>
>> Could you please pay some time to test this series? Thank you.
>
> Thanks for notifying me about the test.
>
> I have tested the patchset(based on the
> https://github.com/loongson/linux/tree/loongarch-next),
> I found that some functions can't  be probed e.g. scheduler_tick() or
> uart_write_wakeup()
> the two functions have the same point,  they are all run in the hardirq context.
>
> I don't know if it's related to the hardirq context, I haven't had
> time to study this patchset carefully.
> and they can be probed in the x86_64 arch.
>
> root@loongarch modules]# insmod ./kprobe_example.ko symbol=scheduler_tick
> insmod: can't insert './kprobe_example.ko': invalid parameter
>
> dmesg:
> [   39.806435] kprobe_init: register_kprobe failed, returned -22
>

Thanks for your test.

On my test environment, I can not reproduce the above issue,
here are the test results, it seems no problem.

[root@linux loongson]# dmesg -c
[root@linux loongson]# uname -m
loongarch64
[root@linux loongson]# modprobe kprobe_example symbol=scheduler_tick
[root@linux loongson]# rmmod kprobe_example
[root@linux loongson]# dmesg | tail -2
[ 3317.138086] handler_post: <scheduler_tick> p->addr = 
0x0000000065d12f66, estat = 0xc0000
[ 3317.154086] kprobe_exit: kprobe at 0000000065d12f66 unregistered

[root@linux loongson]# dmesg -c
[root@linux loongson]# uname -m
loongarch64
[root@linux loongson]# modprobe kprobe_example symbol=uart_write_wakeup
[root@linux loongson]# rmmod kprobe_example
[root@linux loongson]# dmesg | tail -2
[ 3433.502092] handler_post: <uart_write_wakeup> p->addr = 
0x0000000019718061, estat = 0xc0000
[ 3433.762085] kprobe_exit: kprobe at 0000000019718061 unregistered

Additionally, "register_kprobe failed, returned -22" means the symbol
can not be probed, here is the related code:

register_kprobe()
   check_kprobe_address_safe()

static int check_kprobe_address_safe(struct kprobe *p,
				     struct module **probed_mod)
{
	int ret;

	ret = check_ftrace_location(p);
	if (ret)
		return ret;
	jump_label_lock();
	preempt_disable();

	/* Ensure it is not in reserved area nor out of text */
	if (!(core_kernel_text((unsigned long) p->addr) ||
	    is_module_text_address((unsigned long) p->addr)) ||
	    in_gate_area_no_mm((unsigned long) p->addr) ||
	    within_kprobe_blacklist((unsigned long) p->addr) ||
	    jump_label_text_reserved(p->addr, p->addr) ||
	    static_call_text_reserved(p->addr, p->addr) ||
	    find_bug((unsigned long)p->addr)) {
		ret = -EINVAL;
		goto out;
	}
...
}

Thanks,
Tiezhu

