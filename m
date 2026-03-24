Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5D973DE458
	for <loongarch@lists.linux.dev>; Tue, 24 Mar 2026 09:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774345287; cv=none; b=rKhfW9hgBAHf7TX7Uq8c+LVGn4wf4qX4H8Dy1hi/v5ZRtrjFlN+M8KHPre0KxoCzGYfMbP3Kcpum5xd+XXSl15aqNfBFfDCK+JCsPd2r81td/4DONWA59FpiklqcnSSEcnnk+3wPiTa4Z+b+J6V9rN9ypuSfUSjAyMBzJnydv9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774345287; c=relaxed/simple;
	bh=mw51Y/ppZX++/P8IPt+DaSPiMBccEE9fSs97az1KnjE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QGtyqJ0C4z+w6aqpCcrm7S4/VcPea5U4Tx4hyxWEO7iNWdvEbVA4YbYo4leZBqlt3HyZNFjdpGuaQeIuQ4XO9OnJgJ3u03lK/BrNK03fCPuhXeySULL6p5AJ+8ObhF92caMGMAb/4pnZSDDzQX7SCtfqe+nPAMvDPwwZpCjTdtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [209.85.210.171])
	by gateway (Coremail) with SMTP id _____8AxgsBCXMJpeyMeAA--.27182S3;
	Tue, 24 Mar 2026 17:41:23 +0800 (CST)
Received: from mail-pf1-f171.google.com (unknown [209.85.210.171])
	by front1 (Coremail) with SMTP id qMiowJCxecFBXMJprhtcAA--.35655S2;
	Tue, 24 Mar 2026 17:41:22 +0800 (CST)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-829ac4670c4so3897792b3a.0
        for <loongarch@lists.linux.dev>; Tue, 24 Mar 2026 02:41:22 -0700 (PDT)
X-Gm-Message-State: AOJu0YyBsnTF3fUc6q50ccQ0Yryy9DMwRwQxeludtl89EfY+Q5a+cNq+
	ZhtQ3eFcrEBGgr9gja5DuI5Y6aDjo8Kg/9845QMUhOVnajL2rd3BMXw7p9kaVSV9MjHFkmlZie5
	o8LjYUSeWf5u/gcGHiTO/vU9a3WB5KWlfWwRNTbxepg==
X-Received: by 2002:a53:d911:0:b0:64e:8748:38a2 with SMTP id
 956f58d0204a3-64eaa833467mr11980889d50.78.1774344805952; Tue, 24 Mar 2026
 02:33:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260324090106.13527-1-yangtiezhu@loongson.cn> <20260324090106.13527-7-yangtiezhu@loongson.cn>
In-Reply-To: <20260324090106.13527-7-yangtiezhu@loongson.cn>
From: WANG Rui <wangrui@loongson.cn>
Date: Tue, 24 Mar 2026 17:33:15 +0800
X-Gmail-Original-Message-ID: <CAHirt9gFWm+MKYFuz=936bODjmyeONNtmCmwfo=6RcVKixjiWQ@mail.gmail.com>
X-Gm-Features: AaiRm518iICwgwOODgittoMslb9abb3rZMwPuj8NnsMq8NgfAnSheiAHWBmzh30
Message-ID: <CAHirt9gFWm+MKYFuz=936bODjmyeONNtmCmwfo=6RcVKixjiWQ@mail.gmail.com>
Subject: Re: [RFC PATCH 6/7] LoongArch: BPF: Add load-acquire and
 store-release instructions
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: loongarch@lists.linux.dev, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID:qMiowJCxecFBXMJprhtcAA--.35655S2
X-CM-SenderInfo: pzdqw2txl6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x02
	67AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
	ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E
	87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07UE-erUUUUU=

On Tue, Mar 24, 2026 at 5:12=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> Use the native instructions LLACQ.{W/D} and SCREL.{W/D} to support the BP=
F
> load-acquire (BPF_LOAD_ACQ) and store-release (BPF_STORE_REL) instruction=
s
> in the JIT compiler.
>

LLACQ/SCREL are LL/SC primitives rather than plain
load-acquire/store-release instructions.

