Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABB53BADBD
	for <loongarch@lists.linux.dev>; Wed, 11 Mar 2026 16:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773245617; cv=none; b=Bz5Z4NhlC5rVw5JU3bMqsYjIHq87D81rQ5b7gT3CKFrZt7S08vMsbiq8RvbDbKy+jWsvvq+tG9SbULERizQ70A4s5KOfX7nm5ARBKNNOXWWrRUznz5xVqLBlbCVp9xqnMICsT3BUjUuwiBLZNhwNGHKdVSqmddVb8N019QwfMqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773245617; c=relaxed/simple;
	bh=gh/2zF+GZngsA/vrBJJjr24YUrpGsOdq7tnmZizGJWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NMEzkjmZfe5LswDIIcQQeIgISjHPqK7SQhpDoaLmDDK+vmdOJs5i4UFCEA1Nfb0eQl8S9OxojX5MAp7g8GdvoQ+0YIGCgazSPNxfqC9mLBPm1ChNwBEo+3aj+BI1aL3FNyvDMdqcrabo8Y4s2veyT7CyyggsVXZb93xcSNztpBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hMEl5FyT; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hMEl5FyT"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-482f454be5bso13277775e9.0
        for <loongarch@lists.linux.dev>; Wed, 11 Mar 2026 09:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773245615; x=1773850415; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BiVlNQOm1iWKBqBkvdKZ2iGbuTZBkTdRr/I+57FEuaM=;
        b=hMEl5FyTSoGf70cWmrwYtcFPAOy7T6m1yNmT/d5EahZYLTJEiImotxr+m8rh+tEX1t
         GA/sWca0M8fRxy+AEIxR+sNuVeiluax4sjPVV8ZTmmmEBV+I8445YIyNdsD+LlQ6WgsC
         FUVCyYC8OrC+Rcw1lCdhcSUQQzUNLTKgi+atG69ac0a8cpLXB59j4fThb+8oH8jFF99w
         Uv0qiX8a3IdllIdMnn/KAB7cXbZyNoYZgdlrAhcBRpHcDBqf+Iz9IuEBLX8rZ8rsUHEC
         ri1TUljX1CW6/y+0wgufGGHTjAEMCe8siYiumEO7vxRoCh4FZdh8SZKBqXBmsNBHfQxE
         ydjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773245615; x=1773850415;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BiVlNQOm1iWKBqBkvdKZ2iGbuTZBkTdRr/I+57FEuaM=;
        b=VuHUdpxISnZmf4XxgfbDlPZZGc6SIXFa3SD9av05cC53+Be0SmwS31wy+HR3bXC5Yf
         cgSsB6JRDwc3Uq7BCbPbNuyr19tAR4KVIz67GXnERFgxGMgudyQQvNlj1xNtnJpMj5UF
         Hy6TNwYZa566bf38HW81eHtBEHbQ1+FvVF0Z7MDwatBWhpkjSmOsC/+qwuGDHT44g/9I
         43DXcs/aYPwreJpusBlhZiP7UZcL5omSDTOc5LILYMMabBz+19TX5IezTxg8SwXr1Nsb
         5cwDn6T8UBoh42/Y8/qwDNH3ZwiJwabKoKroL4nKDrzkx3roiMMTj5r0HBC2lV3yuQfY
         wjsw==
X-Forwarded-Encrypted: i=1; AJvYcCX/P5GuFjz46cgaVx1lez6cIYrdz1day7dVDGmTErwmy3fFoJWn+oEeBYocQDiMpC+9wYBF+a6aae0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyPUmxaf0WytCQa6HjFdHovtt0xh8ebALjFB3Dw2bK6YvLZ8mMd
	nOMoj/Clhec+MpO5dPOduyjZ4tpp44itvPK3EfryrgdRAL88MZequHnm
X-Gm-Gg: ATEYQzwTt+wzuzVhYVvrFrjyb7rrthcrfvIj28o1+omxywSVKXmWNL2tsOW/cF/Prch
	MuL3IBiLi7aPSMM7GEJqPdIZzTgA2xKY+ZyFIuY0bs7KVq17sGyb5hDoY2ZOi9oQVBpQhh9b3u5
	S3VxZde4/AS59WpqsjNEABwUmd+5coUl7hx8PZHyZn4MEy0j3De4OmUdbGNMsm8ESu+FM68VsL4
	7QN4CMLrZkEF5+hPu4jE3WvEbwUf93w4iyBzG3Z+RlPI7X0VvFqhygMg6PFYV+4QIn0+hHgnyOs
	vktdG8roXhy2i9v97QH/IoObp6GntdLNSIibq/KHJ4ztOgEEAOKagj62rQ5Wa2cvLHPfjbxh/FZ
	f/28KHCJLvKapZCCfILNMVoL4/50pRKMj36ewWpI3EMIy6Ot7VcjwuqXjITt15PfLft/2iglDsl
	3PCd6n0vFFTKc8ByGjJy/YpnBE2Zuz543jFaJrgBquONuJaWnTKACI0HucCpX7TjgA8hGIz7FOu
	uPgirQp75n1UPlHNcu1k68SWgS0UY/MMjSHF3dk6o2ROu/f+7RtBqf3d97N3JYocZ2CaWONnCzh
	lmP/hCSBGIE=
X-Received: by 2002:a05:600c:310b:b0:46e:59bd:f7e2 with SMTP id 5b1f17b1804b1-4854f590efamr2633015e9.11.1773245614671;
        Wed, 11 Mar 2026 09:13:34 -0700 (PDT)
Received: from mail.gmail.com (2a01cb0889497e0050f5e20850bbf776.ipv6.abo.wanadoo.fr. [2a01:cb08:8949:7e00:50f5:e208:50bb:f776])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b7f406sm156122585e9.13.2026.03.11.09.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 09:13:33 -0700 (PDT)
Date: Wed, 11 Mar 2026 17:13:31 +0100
From: Paul Chaignon <paul.chaignon@gmail.com>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Hengqi Chen <hengqi.chen@gmail.com>, loongarch@lists.linux.dev,
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next v1 2/2] selftests/bpf: Add alignment flag for
 test_verifier 190 testcase
Message-ID: <abGUq0yFfzUcY5Vh@mail.gmail.com>
References: <20260310064507.4228-1-yangtiezhu@loongson.cn>
 <20260310064507.4228-3-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310064507.4228-3-yangtiezhu@loongson.cn>

On Tue, Mar 10, 2026 at 02:45:07PM +0800, Tiezhu Yang wrote:
> There exists failure when executing the testcase "./test_verifier 190" if
> CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS is not set on LoongArch.
> 
>   #190/p calls: two calls that return map_value with incorrect bool check FAIL
>   ...
>   misaligned access off (0x0; 0xffffffffffffffff)+0 size 8
>   ...
>   Summary: 0 PASSED, 0 SKIPPED, 1 FAILED
> 
> It means that the program has unaligned accesses, but the kernel sets
> CONFIG_ARCH_STRICT_ALIGN by default to enable -mstrict-align to prevent
> unaligned accesses, so add a flag F_NEEDS_EFFICIENT_UNALIGNED_ACCESS
> into the testcase to avoid the failure.
> 
> This is somehow similar with the commit ce1f289f541e ("selftests/bpf:
> Add F_NEEDS_EFFICIENT_UNALIGNED_ACCESS to some tests").
> 
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  tools/testing/selftests/bpf/verifier/calls.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/testing/selftests/bpf/verifier/calls.c b/tools/testing/selftests/bpf/verifier/calls.c
> index 86887130a0ef..29e57f0e56c3 100644
> --- a/tools/testing/selftests/bpf/verifier/calls.c
> +++ b/tools/testing/selftests/bpf/verifier/calls.c
> @@ -1521,6 +1521,7 @@
>  	.errstr = "R0 invalid mem access 'scalar'",
>  	.result_unpriv = REJECT,
>  	.errstr_unpriv = "invalid read from stack R7 off=-16 size=8",
> +	.flags = F_NEEDS_EFFICIENT_UNALIGNED_ACCESS,
>  },

Acked-by: Paul Chaignon <paul.chaignon@gmail.com>

>  {
>  	"calls: two calls that receive map_value via arg=ptr_stack_of_caller. test1",
> -- 
> 2.42.0
> 
> 
