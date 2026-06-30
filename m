Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D906320CD1
	for <loongarch@lists.linux.dev>; Tue, 30 Jun 2026 23:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782861171; cv=none; b=WtV9zoP5FFN1MFRQb2DbT0AzXUeb/VCKX64dJpK3WQNoaguChIIttTgaulzxz5h5OmyzUjnZMZ5PFygIYGmhjbQhnqEx+0l7LPqbDkVhsWEltcGjgq1SzI0rLgLmndeP0vYYbaFOYk0+LlVcXj4cw9QMmHtQyB87Qk+bg2+86Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782861171; c=relaxed/simple;
	bh=Doir8toan0ZC13VFs7SHG/5xZmfMtSJDpCfUZam2sWo=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=eG3ukeHpE9GcCeT2sajXY4G/YJI4GBWc8TCXnEjNVu2gN5MNLwdmeFQgBP5/J/Kt/Q1aFjMV0gwIAD+nw7NjlL85VFfCsIknEZjq5OaJVW9vI4pz+iUuedrzxr1DlS1TQONDD13HF+lOUCPC9JxMFkijAA2JkHj78XprMh7Un/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gVqoFigp; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gVqoFigp"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6a190528769so19720eaf.0
        for <loongarch@lists.linux.dev>; Tue, 30 Jun 2026 16:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782861169; x=1783465969; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hNs/ZbTedK/pUx9Y12R+Bjea+lbh0cPXPw8B4Fh6zfM=;
        b=gVqoFigpfU0lRl5OpsxT5zUgQBUni9zaNiIjUUJbrACwZNoXrG2RotQ7oblOnrTa86
         FykvuW42Kz6EkiZkUOgFVHCBWItsdq3kfOZjGdml/81JuB1rAS2KHIyGtiWhoY3Mvdxg
         aCckg8xeAGoAFtWqtxIxuCX8w1abIHxjnT+fA7OuJ0kfRE0Z5v11eASEwzbSGZbQYyQi
         Io4OnzM0Hivsg79CJupBJQUJG8jibCM5BbABsMZAo66qsTJQNylC1Y3jl11a+Z3lI6bx
         J6xZqZn8ug9VM4kFsTfoA9FB89feckfzWA6GTAnK6pqimbMQL1gxpWNcbjVYdUMk9ZSk
         LSsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782861169; x=1783465969;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hNs/ZbTedK/pUx9Y12R+Bjea+lbh0cPXPw8B4Fh6zfM=;
        b=VWRS+0RMtojtGnJC8lIGosoVxrqL9tI74NZciEDZhzAiT1kMRrDkrP7Cnr8FNDUPw8
         dB59onuJW54bqtsemwUGgDVx3xnK8H1XROCiksdL2cbDp+D0SewbrkO2Ls6H07pQPYqa
         MWPBdBUy/9k1OCDiDmkMG8225V0g0cWAGiAa57pRXAFween1Xt/qZfk/v8+R89z0JaUP
         ZsrDVT/fVmmpSBJlsDnVAXxbaX+HPKPrQdbM4V1PjQdI4jA8MgGkOwcLf0HVR0YufWFX
         XlQUl/3K/RIcs6MBrw6YU6ezSoWFB2DwW7sXZYQf2h9YQ5J4b3EyCieV1CK7eimZMvBJ
         7lcQ==
X-Forwarded-Encrypted: i=1; AFNElJ8LNgJJaN4M2/RHBgBISUM33IhJTzDV8QiU+Ad+gmks2Iujx9vTQ7+oKTaB2GBY4uWI2r1n/o5QZCc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0YNRK0DTgcld24hp9/uFwI9KK5iiIWa3Y0QVarW0br35qEFLg
	aoJqwS/oUEJi2Kj+6T3+Fv/u1qvBioLUuGFPSRDWPX/IhLi+Nz5o18gM
X-Gm-Gg: AfdE7ckflAUFgEkBvVJxh+2uyp+Zx6tP9lEKzwgzOStA9JtQhF/KgGTrswMGvQCCjNL
	rwhuNoPs1hhCXHHG4ribEupOOv7wGpErFFTzs5wQGOn6QGDURWaQqoKks9KlFFEwy8TCUOBu3my
	ivB+4qyLDNdNiWGfAsSjQXPKjLtriMXKnJDPnOEp5hDd8QJ2ehcLu5kB8Z3cc3GJvnkH1mkF+s3
	yG0WOEtocVRq3/o6mlzz7uGTLa/tBxfHAzNgDjIZ3i6gc1Ce9gw+LyTZ+CFMqp/b2SCfOjV8tbd
	sQe4MsWDdbHyVBkscAZjNYk+wsdUvkK7wxUBVfRZLC0YcUcnTvL/qfDN0XHDzZtWP3KEqydR7xf
	Ie5H+DuDflcLo/ruNkjcZbsf27p70Izw0hExByLu56q9RfICW7p/UQNhYIRLg8Ar8nDe6xi81fB
	gjrqFL0HKIy4cfyAtxjDKT4Btr9Mfz29lNk19/tTUEkqGr1vbXPBRXBDEkaoc6Q5Otug6bGNwXZ
	wejIYI=
X-Received: by 2002:a05:6820:6aea:b0:69e:3c9e:5e82 with SMTP id 006d021491bc7-6a196c2f6fcmr1648095eaf.42.1782861168855;
        Tue, 30 Jun 2026 16:12:48 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:40::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a189493f93sm2787431eaf.14.2026.06.30.16.12.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 16:12:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 30 Jun 2026 16:12:47 -0700
Message-Id: <DJMRJDHUOXMJ.2NOKJLI4RA1ZU@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Tiezhu Yang" <yangtiezhu@loongson.cn>, "Alexei Starovoitov"
 <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii
 Nakryiko" <andrii@kernel.org>
Cc: "Puranjay Mohan" <puranjay@kernel.org>, <loongarch@lists.linux.dev>,
 <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next v4] bpf: Fix unaligned interpreter panic on JIT
 fallback path
X-Mailer: aerc
References: <20260615025316.24429-1-yangtiezhu@loongson.cn>
 <ed0326b4-2953-16a6-0472-5fa96df1d63e@loongson.cn>
In-Reply-To: <ed0326b4-2953-16a6-0472-5fa96df1d63e@loongson.cn>

On Mon Jun 29, 2026 at 6:13 PM PDT, Tiezhu Yang wrote:
> On 2026/6/15 =E4=B8=8A=E5=8D=8810:53, Tiezhu Yang wrote:
>> When an architecture implements bpf_jit_inlines_helper_call(), such
>> as LoongArch, ARM64, and RISC-V, the BPF verifier skips rewriting
>> the helper call offset (insn->imm) during the bpf_do_misc_fixups()
>> phase if the helper is expected to be inlined by the JIT compiler.
>> As a result, insn->imm remains as the raw helper enum ID.
>>=20
>> However, if JIT is disabled at runtime (net.core.bpf_jit_enable=3D0)
>> or if the JIT compilation later dynamically fails (e.g., due to OOM
>> during bpf_jit_alloc_exec()), the core BPF subsystem falls back to
>> the BPF interpreter.
>>=20
>> When the fallback interpreter executes (__bpf_call_base + insn->imm)
>> with the unpatched raw helper ID, it jumps into an unaligned invalid
>> address space, triggering a fatal instruction alignment fault (ADEF)
>> or illegal memory access kernel panic.
>>=20
>> This issue impacts all architectures that support helper inlining,
>> so introduce a late fixup pass via bpf_fixup_fallback_helpers() in
>> __bpf_prog_select_runtime() to fix this panic.
>>=20
>> When JIT compilation fails or is disabled, the helper call offsets
>> originally skipped for inlining are rewritten to relative memory
>> offsets right before transferring control to the interpreter.
>>=20
>> 1. Test case (test_panic.c):
>>=20
>>    #include <linux/bpf.h>
>>    #include <bpf/bpf_helpers.h>
>>=20
>>    SEC("kprobe/sys_getpid")
>>    int test_panic(void *ctx)
>>    {
>>    	struct task_struct *task;
>>=20
>>    	task =3D (struct task_struct *)bpf_get_current_task();
>>    	if (task)
>>    		bpf_printk("Task address: %p\n", task);
>>=20
>>    	return 0;
>>    }
>>=20
>>    char LICENSE[] SEC("license") =3D "GPL";
>>=20
>> 2. Reproduction steps:
>>=20
>>    $ clang -target bpf -O2 -g -c test_panic.c -o test_panic.o
>>    $ sudo sysctl -w net.core.bpf_jit_enable=3D0
>>    $ sudo bpftool prog load test_panic.o /sys/fs/bpf/test_panic autoatta=
ch
>>    $ sudo cat /sys/kernel/debug/tracing/trace_pipe
>>=20
>> 3. Panic information on LoongArch:
>>=20
>>    Kernel ade access[#1]:
>>    ...
>>        ra: 9000000000486e50 ___bpf_prog_run+0x1370/0x36b0
>>       ERA: 9000000000485383 __bpf_prog_ret0_warn+0x13/0x20
>>    ...
>>     ESTAT: 00080000 [ADEF] (IS=3D ECode=3D8 EsubCode=3D0)
>>=20
>> Fixes: 2ddec2c80b44 ("riscv, bpf: inline bpf_get_smp_processor_id()")
>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>> Acked-by: Leon Hwang <leon.hwang@linux.dev>
>> Tested-by: Xu Kuohai <xukuohai@huawei.com>
>> ---
>> v4:
>>    - Rename the static function to bpf_fixup_fallback_helpers() to
>>      be more accurate and concise, following the file's naming style.
>>    - Remove redundant helper ID bounds check since invalid helper
>>      IDs are already filtered out in bpf_jit_inlines_helper_call().
>>    - Simplify code by merging nested if statements for helper checks.
>>=20
>>   kernel/bpf/core.c | 22 ++++++++++++++++++++++
>>   1 file changed, 22 insertions(+)
>>=20
>> diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
>> index 649cce41e13f..0db6e55bad52 100644
>> --- a/kernel/bpf/core.c
>> +++ b/kernel/bpf/core.c
>> @@ -2608,6 +2608,25 @@ static struct bpf_prog *bpf_prog_jit_compile(stru=
ct bpf_verifier_env *env, struc
>>   	return prog;
>>   }
>>  =20
>> +/* Fix up helper call offsets on JIT fallback path. */
>> +static void bpf_fixup_fallback_helpers(struct bpf_verifier_env *env, st=
ruct bpf_prog *fp)
>> +{
>> +	struct bpf_insn *insn =3D fp->insnsi;
>> +	const struct bpf_func_proto *fn;
>> +	int i;
>> +
>> +	if (!env || !env->ops->get_func_proto)
>> +		return;
>> +
>> +	for (i =3D 0; i < fp->len; i++, insn++) {
>> +		if (bpf_helper_call(insn) && bpf_jit_inlines_helper_call(insn->imm)) =
{
>> +			fn =3D env->ops->get_func_proto(insn->imm, env->prog);
>> +			if (fn && fn->func)
>> +				insn->imm =3D fn->func - __bpf_call_base;
>> +		}
>> +	}
>> +}
>> +
>>   struct bpf_prog *__bpf_prog_select_runtime(struct bpf_verifier_env *en=
v, struct bpf_prog *fp,
>>   					   int *err)
>>   {
>> @@ -2643,6 +2662,9 @@ struct bpf_prog *__bpf_prog_select_runtime(struct =
bpf_verifier_env *env, struct
>>   			*err =3D -ENOTSUPP;
>>   			return fp;
>>   		}
>> +
>> +		if (!fp->jited)
>> +			bpf_fixup_fallback_helpers(env, fp);
>>   	} else {
>>   		*err =3D bpf_prog_offload_compile(fp);
>>   		if (*err)
>>=20
>
> Ping? Any more comments?

See my reply to Leon.
