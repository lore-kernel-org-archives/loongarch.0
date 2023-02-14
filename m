Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6CCE7C
	for <loongarch@lists.linux.dev>; Tue, 14 Feb 2023 09:03:52 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.120])
	by gateway (Coremail) with SMTP id _____8Dx2tl2TutjZHQAAA--.1209S3;
	Tue, 14 Feb 2023 17:03:50 +0800 (CST)
Received: from [10.20.42.120] (unknown [10.20.42.120])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxyuZ0TutjzMIyAA--.60563S3;
	Tue, 14 Feb 2023 17:03:49 +0800 (CST)
Subject: Re: [PATCH v1 03/24] LoongArch: KVM: Implement vcpu
 create,run,destroy operations.
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20230214025648.1898508-1-zhaotianrui@loongson.cn>
 <20230214025648.1898508-4-zhaotianrui@loongson.cn>
 <Y+ssx3hQPD2l23u+@kroah.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Mark Brown <broonie@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>
From: Tianrui Zhao <zhaotianrui@loongson.cn>
Message-ID: <a6806992-723b-2796-ba8e-108d18f3f64e@loongson.cn>
Date: Tue, 14 Feb 2023 17:03:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Y+ssx3hQPD2l23u+@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxyuZ0TutjzMIyAA--.60563S3
X-CM-SenderInfo: p2kd03xldq233l6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvdXoWrtw43Kr4rAF17Cry7Jr4kXrb_yoWfAwb_Wr
	4vga4DKr1jqFnIyanxGwsrtFyrJF4rX3W7ZrWjqFZrCr1jv395Kr4vgrs3u3Z7ta47tFn8
	X390kry3trnFgjkaLaAFLSUrUUUU8b8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
	xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUO
	e7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
	AFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
	6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7
	xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr0_GcWln4kS
	14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE
	7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I
	0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAI
	cVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcV
	CF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4UJVWxJr1lIxAIcVC2z280
	aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07j2MKZUUUUU=



在 2023年02月14日 14:40, Greg Kroah-Hartman 写道:
> On Tue, Feb 14, 2023 at 10:56:27AM +0800, Tianrui Zhao wrote:
>> Implement loongarch vcpu related operations:
>> 1. Implement vcpu create interface, saving some info into vcpu arch
>> structure such as vcpu exception entrance, vcpu enter guest pointer,
>> etc. Init vcpu timer and set address translation mode when vcpu create.
>> 2. Implement vcpu run interface, handling mmio, iocsr reading fault
>> and deliver interrupt, lose fpu before vcpu enter guest.
>> 3. Implement vcpu handle exit interface, getting the exit code by ESTAT
>> register and using kvm exception vector to handle it.
> Again, when you have to list different things in a patch, that is a huge
> hint that it needs to be split up into smaller pieces.
Thanks for your advice, I will fix my patch and split it into smaller 
pieces.

Thanks,
Tianrui Zhao
>
> thanks,
>
> greg k-h


