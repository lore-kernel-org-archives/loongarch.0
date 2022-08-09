Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0515E15A7
	for <loongarch@lists.linux.dev>; Tue,  9 Aug 2022 12:55:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8D8BC433D6
	for <loongarch@lists.linux.dev>; Tue,  9 Aug 2022 12:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660049723;
	bh=HYTU6s4wkDswBDrKHR2HRzxzEsFjP+7kaCwB9Uteq+A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=t0VKBtHlKCYjQMBKdlCJdOzhb3ZLGbh4AkDsSBQoE/YTBpXnPb5YQjThQLMtW82Cs
	 ZIqt74o/X/+axWenE1A0Zb5HesKTlPX4put6hnhi83NAZMUpPaEXh/pHrqTG33Vcx2
	 gLTGQbe7BrJi92aU/9yV4rwedJR++nUKx5DhZmpY+MU0QQhKwlH2ibcLzjmQL6dHFP
	 vFN23TMmJMXxTkkipUlCUMxQ6NJiiRGLnJqS1cuKpMnzIewKV3XV4jOOn+mU1FJRHm
	 33HqfhsFxilfJ7rDJZYqhcxZYivcdcMX8CUqlAxLcURGI+T/W2tPfuatgKvqIo7hRa
	 D+hSW9tjLsK8w==
Received: by mail-ua1-f47.google.com with SMTP id cd25so2121978uab.8
        for <loongarch@lists.linux.dev>; Tue, 09 Aug 2022 05:55:23 -0700 (PDT)
X-Gm-Message-State: ACgBeo2wTjwe6EbJDXEsvFR1/cxTcY45DEJKSPmgVyXGDGdxTEIfsy7J
	y7Vpfkr2OBm1ykRFHg17LFhgyOOtlw67eAPBuuk=
X-Google-Smtp-Source: AA6agR59WpakOsK1pLPhjqZCUJ8qfQNKofKe4dfXmRHMeWtE+9eF3WfSE0/mqtMSMsvnjNqMjHoeaZ7fhY4YD5TDII0=
X-Received: by 2002:ab0:2150:0:b0:384:ba63:69f9 with SMTP id
 t16-20020ab02150000000b00384ba6369f9mr9783484ual.100.1660049722703; Tue, 09
 Aug 2022 05:55:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1660013580-19053-1-git-send-email-yangtiezhu@loongson.cn>
 <1660013580-19053-2-git-send-email-yangtiezhu@loongson.cn> <41d7214b-54db-6637-ee8b-2f94ca2b70c5@loongson.cn>
In-Reply-To: <41d7214b-54db-6637-ee8b-2f94ca2b70c5@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 9 Aug 2022 20:55:11 +0800
X-Gmail-Original-Message-ID: <CAAhV-H76yjK4=tGzRrmuYftpQRFxyz+f0NiCG03qv2eTyU1FQQ@mail.gmail.com>
Message-ID: <CAAhV-H76yjK4=tGzRrmuYftpQRFxyz+f0NiCG03qv2eTyU1FQQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/5] LoongArch: Fix some instruction formats
To: Youling Tang <tangyouling@loongson.cn>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, bpf@vger.kernel.org, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 9, 2022 at 8:01 PM Youling Tang <tangyouling@loongson.cn> wrote:
>
> Hi, Tiezhu
>
> On 08/09/2022 10:52 AM, Tiezhu Yang wrote:
> > struct reg2i12_format is used to generate the instruction lu52id
> > in larch_insn_gen_lu52id(), according to the instruction format
> > of lu52id in LoongArch Reference Manual [1], the type of field
> > "immediate" should be "signed int" rather than "unsigned int".
> >
> > There are similar problems in the other structs reg0i26_format,
> > reg1i20_format, reg1i21_format and reg2i16_format, fix them.
> >
> > [1] https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN.html#_lu12i_w_lu32i_d_lu52i_d
> >
> > Fixes: b738c106f735 ("LoongArch: Add other common headers")
>  >
> We may not be able to say "Fixes" here, because it is also correct to
> treat each field of the instruction as an "unsinged int" type (signed
> or not has no effect on the machine instruction stream, but it does
> affect the programmer).
>
> For example, when reg2i12_format.immediate is changed to "signed" type,
> the immediate judgment in is_stack_alloc_ins() can be simplified,
I prefer to use "unsigned int" because in an instruction the imm field
is essentially just bit-stream.

Huacai
>
> static inline bool is_stack_alloc_ins(union loongarch_instruction *ip)
> {
>      /* addi.d $sp, $sp, -imm */
>      return ip->reg2i12_format.opcode == addid_op &&
>          ip->reg2i12_format.rj == LOONGARCH_GPR_SP &&
>          ip->reg2i12_format.rd == LOONGARCH_GPR_SP &&
> -        is_imm12_negative(ip->reg2i12_format.immediate);
> +        (ip->reg2i12_format.immediate < 0;
> }
>
>
> Thanks,
> Youling
> > Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> > ---
> >  arch/loongarch/include/asm/inst.h | 14 +++++++-------
> >  1 file changed, 7 insertions(+), 7 deletions(-)
> >
> > diff --git a/arch/loongarch/include/asm/inst.h b/arch/loongarch/include/asm/inst.h
> > index 7b07cbb..ff51481 100644
> > --- a/arch/loongarch/include/asm/inst.h
> > +++ b/arch/loongarch/include/asm/inst.h
> > @@ -53,35 +53,35 @@ enum reg2i16_op {
> >  };
> >
> >  struct reg0i26_format {
> > -     unsigned int immediate_h : 10;
> > -     unsigned int immediate_l : 16;
> > +     signed int immediate_h : 10;
> > +     signed int immediate_l : 16;
> >       unsigned int opcode : 6;
> >  };
> >
> >  struct reg1i20_format {
> >       unsigned int rd : 5;
> > -     unsigned int immediate : 20;
> > +     signed int immediate : 20;
> >       unsigned int opcode : 7;
> >  };
> >
> >  struct reg1i21_format {
> > -     unsigned int immediate_h  : 5;
> > +     signed int immediate_h  : 5;
> >       unsigned int rj : 5;
> > -     unsigned int immediate_l : 16;
> > +     signed int immediate_l : 16;
> >       unsigned int opcode : 6;
> >  };
> >
> >  struct reg2i12_format {
> >       unsigned int rd : 5;
> >       unsigned int rj : 5;
> > -     unsigned int immediate : 12;
> > +     signed int immediate : 12;
> >       unsigned int opcode : 10;
> >  };
> >
> >  struct reg2i16_format {
> >       unsigned int rd : 5;
> >       unsigned int rj : 5;
> > -     unsigned int immediate : 16;
> > +     signed int immediate : 16;
> >       unsigned int opcode : 6;
> >  };
> >
> >
>
