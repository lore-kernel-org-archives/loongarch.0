Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5ADA7F
	for <loongarch@lists.linux.dev>; Tue,  2 Aug 2022 01:35:46 +0000 (UTC)
Received: from [10.130.0.63] (unknown [113.200.148.30])
	by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxEM9vf+hisOUAAA--.5000S3;
	Tue, 02 Aug 2022 09:35:44 +0800 (CST)
Subject: Re: [PATCH 0/4] LoongArch: Add unwinder support
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev,
 LKML <linux-kernel@vger.kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Jinyang He <hejinyang@loongson.cn>
References: <20220801121726.9681-1-zhangqing@loongson.cn>
 <CAAhV-H61DOGHXeVmZif7e04jpYBZNja-wPyLFhAtECZkZSQScA@mail.gmail.com>
From: zhangqing <zhangqing@loongson.cn>
Message-ID: <53e44881-feae-c4c0-5a25-04f7dbeec38f@loongson.cn>
Date: Tue, 2 Aug 2022 09:35:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H61DOGHXeVmZif7e04jpYBZNja-wPyLFhAtECZkZSQScA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf9DxEM9vf+hisOUAAA--.5000S3
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYf7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E
	6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
	kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8I
	cVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2js
	IEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAK
	zVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx
	8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY
	jI0SjxkI62AI1cAE67vIY487MxkIecxEwVAFwVWkMxAIw28IcxkI7VAKI48JMxC20s026x
	CaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_
	JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r
	1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_
	Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JV
	W8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbNzVUUUUUU==
X-CM-SenderInfo: x2kd0wptlqwqxorr0wxvrqhubq/



On 2022/8/1 下午11:34, Huacai Chen wrote:
> Hi, Qing,
> 
> I think we don't need to CC linux-kernel; on the other hand, CC
> linux-arch and Arnd is worthy.
> BTW, it seems you are missing V2 in the title.
> 
> Huacai

Hi, Huacai

Made a careless error...

Thanks,
-Qing

