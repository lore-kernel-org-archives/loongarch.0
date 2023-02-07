Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 562DF29CA
	for <loongarch@lists.linux.dev>; Tue,  7 Feb 2023 13:28:48 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.155])
	by gateway (Coremail) with SMTP id _____8AxGuoJUuJjyooPAA--.30504S3;
	Tue, 07 Feb 2023 21:28:41 +0800 (CST)
Received: from [10.20.42.155] (unknown [10.20.42.155])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Bxjb4JUuJjVXQrAA--.21977S3;
	Tue, 07 Feb 2023 21:28:41 +0800 (CST)
Subject: Re: [PATCH] LoongArch: Make -mstrict-align be configurable
To: Arnd Bergmann <arnd@arndb.de>, WANG Xuerui <kernel@xen0n.name>,
 David Laight <David.Laight@ACULAB.COM>, Huacai Chen <chenhuacai@kernel.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>,
 "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
 Linux-Arch <linux-arch@vger.kernel.org>, Xuefeng Li <lixuefeng@loongson.cn>,
 guoren <guoren@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20230202084238.2408516-1-chenhuacai@loongson.cn>
 <363cd09a5dcb4deab21f58c19025254f@AcuMS.aculab.com>
 <CAAhV-H7Mz1Z5Bo59tq5VRSUx-N39axeiG7xZs2Szn6nuOxgZfQ@mail.gmail.com>
 <9936da8f577842b8b5edafcdc69dc2d1@AcuMS.aculab.com>
 <560d73a8-2f2a-4844-44ff-afffad9c8694@loongson.cn>
 <379bcb55-f75d-02ce-a51b-467e21ade5a3@xen0n.name>
 <dcd17646-4b8d-447b-bd85-c66c4a7b2cf4@app.fastmail.com>
From: Jianmin Lv <lvjianmin@loongson.cn>
Message-ID: <924aa802-410d-a85c-b623-7ca30d15c637@loongson.cn>
Date: Tue, 7 Feb 2023 21:28:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <dcd17646-4b8d-447b-bd85-c66c4a7b2cf4@app.fastmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Bxjb4JUuJjVXQrAA--.21977S3
X-CM-SenderInfo: 5oymxthqpl0qxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvdXoWrtF15Xry8KF15uFWUtF4kCrg_yoW3WrX_ZF
	93G34fu34kAayxWwsFqa98CrySqr12k3yUAF48Xw4aq3W7JFZ3ursxXr4avryDKayIqrZ3
	AFW5Gr1xC3s2yjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
	xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
	I7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
	AFIxvE14AKwVWUGVWUXwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
	6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7
	xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS
	0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0V
	AKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l42
	xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWU
	GwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI4
	8JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4U
	MIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I
	8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcrWFUUUUU



On 2023/2/7 下午6:32, Arnd Bergmann wrote:
> I agree the default should always be to have a kernel that works on
> every machine that has been produced, but this also depends on which
> models specifically lack the unaligned access. If it's just about
> pre-production silicon that is now all but scrapped, things are different
> from a situation where users may actually use them for normal workloads.
> 
> Is there an overview of the available loongarch CPU cores that have
> been produced so far, and which ones support unaligned access?

So far, produced CPUs based LoongArch include 3A5000, 3B5000, 3C5000L, 
3C5000, 2K2000, 2K1000LA and 2K0500, where 2K1000LA and 2K0500 are 
unaligned-access-unsupported, and others are unaligned-access-supported.

