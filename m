Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CF931106
	for <loongarch@lists.linux.dev>; Wed, 30 Aug 2023 03:25:59 +0000 (UTC)
Received: from loongson.cn (unknown [10.180.128.250])
	by gateway (Coremail) with SMTP id _____8CxNvHCtu5kW_kcAA--.59006S3;
	Wed, 30 Aug 2023 11:25:55 +0800 (CST)
Received: from crazy.crazy.loongson.org (unknown [10.180.128.250])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxriPBtu5k9+5mAA--.12310S4;
	Wed, 30 Aug 2023 11:25:53 +0800 (CST)
From: liweihao <liweihao@loongson.cn>
To: wangrui@loongson.cn
Cc: chenhuacai@kernel.org,
	kernel@xen0n.name,
	linux-kernel@vger.kernel.org,
	liweihao@loongson.cn,
	loongarch@lists.linux.dev,
	masahiroy@kernel.org,
	yijun@loongson.cn
Subject: Re: [PATCH 1/1] LoongArch: adjust copy/clear_user exception handler behavior
Date: Wed, 30 Aug 2023 11:25:53 +0800
Message-Id: <20230830032553.2974884-1-liweihao@loongson.cn>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <CAHirt9i0tcUCuQ5ZL657MOZ4CUg0bpfiNbo01WLhPAwsLjgM+g@mail.gmail.com>
References: <CAHirt9i0tcUCuQ5ZL657MOZ4CUg0bpfiNbo01WLhPAwsLjgM+g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxriPBtu5k9+5mAA--.12310S4
X-CM-SenderInfo: 5olzvxhkdrqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUU9qb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x02
	67AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
	ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E
	87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82
	IYc2Ij64vIr41l4c8EcI0En4kS14v26r1Y6r17MxC20s026xCaFVCjc4AY6r1j6r4UMxCI
	bckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_Jr
	I_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v2
	6r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj4
	0_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8
	JbIYCTnIWIevJa73UjIFyTuYvjxUwmhFDUUUU

Hello WANG Rui,

> > +.Lsmall_fixup:
> > +29:    st.b    zero, a0, 0
> > +       addi.d  a0, a0, 1
> > +       addi.d  a1, a1, -1
> > +       bgt     a1, zero, 1b
> 
> I'm sure the jump target here is 29b.

You are right, this is a mistake.

I'll correct it later. Thanks.

