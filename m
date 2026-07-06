Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA5539EF20
	for <loongarch@lists.linux.dev>; Mon,  6 Jul 2026 04:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783310410; cv=none; b=BYKr+bWlSJjTdYFpxJ8uJ7gXa8YaUe8HpxNaogGxjVwsJ3rtCwljLPmVoiK8Y/THI4HwlqQ1ttj7Yd8872cHqL0Eaibopx5uPryoQ5w2GR0wSX1ALmPhrI4f6U1YqN0OTp91S1E3A0sZH64fdNMqD4f2WxJb8bkI5AOaRWRWmpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783310410; c=relaxed/simple;
	bh=TlC6QRdgNB8lQwo0I7R7Lyo1gnJ91Si7lvn5pi8rPNI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LEP+dhOrjAmjSX7mwwoGmZMuWLYo0TlBCjl19v2JmAedlry3pZgXt85q1LsWroHb8O9dbdh3s0MQNNwGCEY01K5ud0rym5vyFjgVigSJXo4IIgQTKEnGMZn5E5dNclFmHNAdWY45d6no30+KzrMBGMsnSoDhdas0Hy6K4oft1p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=toKHo5SJ; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="toKHo5SJ"
Message-ID: <746b428a-a81f-4b8e-a767-109965959170@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783310405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ghqALS/NM0ybJ1g9tsK48doH0iIj7FBvHhLKHdQ1DtQ=;
	b=toKHo5SJahL0xnnfSSGUAahaRrtJBFT24i75X2ESfA1aIvQAsh8iw3ImWKbYXXmYlqN02R
	hi91txt035VSmzJn0aIsgQSmjdJt0YrWLiBumDwOVnr+voCgQAr4HEsCVFq+VPqqDDmi59
	dJ/QdtAP3n1RWaRieYdDqiBCB2gV7cg=
Date: Mon, 6 Jul 2026 11:59:55 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v7 1/2] bpf: Introduce jit_required flag and
 refactor kfunc path
Content-Language: en-US
To: Tiezhu Yang <yangtiezhu@loongson.cn>, KaFai Wan <kafai.wan@linux.dev>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>
Cc: bpf@vger.kernel.org, loongarch@lists.linux.dev,
 Puranjay Mohan <puranjay@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>
References: <20260702143656.28845-1-yangtiezhu@loongson.cn>
 <20260702143656.28845-2-yangtiezhu@loongson.cn>
 <ba5679e744e0209ca10788c2c385c6727eddb8a5.camel@linux.dev>
 <2d1babdf-a4d9-9902-77b0-3f5640871323@loongson.cn>
 <2240908fb833182e502d1804b392874cccf17b6c.camel@linux.dev>
 <aa26b3fc-9717-4273-dd76-a0dd6b15ff61@loongson.cn>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <aa26b3fc-9717-4273-dd76-a0dd6b15ff61@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 6/7/26 08:56, Tiezhu Yang wrote:
> On 2026/7/4 上午9:57, KaFai Wan wrote:
>> On Sat, 2026-07-04 at 00:14 +0800, Tiezhu Yang wrote:
>>> On 7/3/26 21:55, KaFai Wan wrote:
>>>> On Thu, 2026-07-02 at 22:36 +0800, Tiezhu Yang wrote:
> 
> ...
> 
>>>
>>> IIUC, there are two places to modify so far:
>>> (1) struct bpf_prog
>>
>> yes
>>
>>> (2) bpf_prog_has_kfunc_call()
>>
>> I think we can remove this func.
>>
>> actually, I feed your patch to dsv4-pro and gpt-5.4 yesterday, both
>> point out the we should do this
>> and change the log message.
>>
>> diff --git a/kernel/bpf/fixups.c b/kernel/bpf/fixups.c
>> index 12a8a4eb757f..7fb92b5fa415 100644
>> --- a/kernel/bpf/fixups.c
>> +++ b/kernel/bpf/fixups.c
>> @@ -1378,7 +1378,6 @@ int bpf_fixup_call_args(struct bpf_verifier_env
>> *env)
>>   #ifndef CONFIG_BPF_JIT_ALWAYS_ON
>>       struct bpf_prog *prog = env->prog;
>>       struct bpf_insn *insn = prog->insnsi;
>> -    bool has_kfunc_call = bpf_prog_has_kfunc_call(prog);
>>       int depth;
>>   #endif
>>       int i, err = 0;
>> @@ -1404,7 +1403,7 @@ int bpf_fixup_call_args(struct bpf_verifier_env
>> *env)
>>               return err;
>>       }
>>   #ifndef CONFIG_BPF_JIT_ALWAYS_ON
>> -    if (has_kfunc_call) {
>> +    if (prog->jit_required) {


Agreed with this change.

Then, think it harder, pls.

Can we clean some code of __bpf_prog_select_runtime() btw?

diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
index 649cce41e13f..bad55e119cb5 100644
--- a/kernel/bpf/core.c
+++ b/kernel/bpf/core.c
@@ -120,6 +120,9 @@ struct bpf_prog *bpf_prog_alloc_no_stats(unsigned
int size, gfp_t gfp_extra_flag
 		return NULL;
 	}

+#ifdef CONFIG_BPF_JIT_ALWAYS_ON
+	fp->jit_required = true;
+#endif
 	fp->pages = size / PAGE_SIZE;
 	fp->aux = aux;
 	fp->aux->main_prog_aux = aux;
@@ -2614,15 +2617,11 @@ struct bpf_prog
*__bpf_prog_select_runtime(struct bpf_verifier_env *env, struct
 	/* In case of BPF to BPF calls, verifier did all the prep
 	 * work with regards to JITing, etc.
 	 */
-	bool jit_needed = false;
+	bool jit_needed = fp->jit_required;

 	if (fp->bpf_func)
 		goto finalize;

-	if (IS_ENABLED(CONFIG_BPF_JIT_ALWAYS_ON) ||
-	    bpf_prog_has_kfunc_call(fp))
-		jit_needed = true;
-
 	if (!bpf_prog_select_interpreter(fp))
 		jit_needed = true;

WDYT?

Thanks,
Leon

>>           verbose(env, "calling kernel functions are not allowed in
>> non-JITed programs\n");
>>           return -EINVAL;
>> [...]
