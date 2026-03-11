Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312CA374160
	for <loongarch@lists.linux.dev>; Wed, 11 Mar 2026 15:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773244674; cv=none; b=RhNQb1R7ggjW4uuCkZ61G3PxkGWx4X78SssoWBVQkXwmyXJHYzpSp+zO8tBTIRbJgFw9DHSyvIRGFRQwm1ne6odkNk5mAUn0eHUj4zf9whoQMuTbP8r9wG8NfT+tGr/v7uUTQmfcc6ddQKklr7+xCanmQSM6I7XpjdnXnkASjf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773244674; c=relaxed/simple;
	bh=EmmYw85cVUEsq7+BHHJmxj7CNzz1yX/2XuoCf8SaapM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=pbaRaNGQD6rlzAk1cH1Dhz7VJv8U4XV6mLwD1A3Sb7uqQTObEcBeecrk1c1FGvRHte1ubQsP7WwgECVSEvZvjAN61r+zR20x9CwAxERJyzp6EX2jwLZcx4vc/5qDYDeqGzw1CjiKw/NO2IxkpeayXAvC4aCTj+YS38ZxHdsT+bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20230601.gappssmtp.com header.i=@etsalapatis-com.20230601.gappssmtp.com header.b=UanV81jt; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20230601.gappssmtp.com header.i=@etsalapatis-com.20230601.gappssmtp.com header.b="UanV81jt"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8cd751a4e93so305168685a.0
        for <loongarch@lists.linux.dev>; Wed, 11 Mar 2026 08:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20230601.gappssmtp.com; s=20230601; t=1773244672; x=1773849472; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aURB3PEouSQXz0zXeDm8x4IHWh8OR3JzdVl/0kglorE=;
        b=UanV81jtqYquQEeCq+ruOKcLy3nlz8efK9wt4APtwta96Jq/oEXQjPq9uskIjW43xL
         pBuRUTMihkI5CJ/UjTdbDYfLaH3sozXpmgQNyQy1OwTZMmnFaaA2L4FdukqzeRHXdehI
         mq1qKYxeKg2zbXIzuu0DxzShJsvyjhJQzycT9fry+FEW7LXoZCyQfRuy6GoBJHNTNg7K
         M7X4Gnh0Yn8yPr5LQfLSArR0a6/CSxiFPWTMVzR6eTfQ0Gk/xr6Z2932FIWecK6qJueo
         aWj6yWSZ9YEjmAgnons7b7e5JTNd13l9VY6UwZZIMRdmMWPBMyH4N2hRnJYj9oOW2bHX
         V29Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773244672; x=1773849472;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aURB3PEouSQXz0zXeDm8x4IHWh8OR3JzdVl/0kglorE=;
        b=lsDCmF+MDnm357lf2ZzV3traRPM5TQAEKkQM+CorBT44Ly/xFxpC5AKC1LaiGzAQ17
         FrKaPu3PPvVIBYoqXhB81m3lyix+c+L/W4JI5l+51qrvOnMpSc+nnSoI7BLtCRHsGILE
         XPNX6z4kwkmiWAcdaIbhX6w5YJUMuUSvgdPDJwfklmsyXIfRAArR8ERPoDxMqZ5Rmu+D
         ovB63QtwzMMqo3E/0zM0KJUUdZUP6BHkFxRPO+nwikrWtCJaH9PYDL9PgYeMSlwJlL2p
         tGMVNxQIp+LRFDPXol+d4imZZgJoDLK4DoYRl8LyeX3lm4WW36yKUB6MTx4jNzX9s4sX
         ZBVQ==
X-Gm-Message-State: AOJu0Yz35CryiDRhAdnldlpvRkNqmUitAZV5ZHBE0i1gs5x3avbKdCYQ
	vYkJ64X92nbe3HVXUcDpQ7VRVETGknoOsAtTHsA5m7peLqUzdYbE+dfsn/F/apmqeBw=
X-Gm-Gg: ATEYQzwv/S+m6o2LN/1FBzdBI8+lFLCHM4xpQVhUT+IM3N3bcRIPHBT+4mESmcepiJ9
	Q/qIzHm/wxfZbdmPVDd7IwKAPpnapNvgoP2314/hqti0ALd4lvjnYQtGXUFMPVof/YmT87WJ4yT
	MuQi2licOf5EDnAj6rIC/fKhfu9EZbZnHgAC7qihN1IHDrdGYG/8M2ovyE4yrHcnl4Z5yoNysSn
	qGIp0wepOydPplH1KqUHP6pHMro4BnCg4nAEInmOgELf4sUCHoDFWKECD+6B4DmfZpT+ma6lBf8
	f0XFZALcs94RVH2t4nwNMR+UGln1MjkRfXW//3hr001xS70xAtFnGcCbsfKlXZ6UtIjC3m2QHe+
	HwPLc5BFKGPgW4g0ySd3p7gj8e9PBErOHzbU3g1Z5FbYVH6SKgDkL2TNkTCPow9QVX5FQRSjJA3
	KnG9iwKmrW+ndGSqGBQcgAV2c=
X-Received: by 2002:a05:620a:d83:b0:8cd:a071:9ab2 with SMTP id af79cd13be357-8cda1a826cbmr359119185a.77.1773244672044;
        Wed, 11 Mar 2026 08:57:52 -0700 (PDT)
Received: from localhost ([140.174.219.137])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cda1fc474dsm167299685a.6.2026.03.11.08.57.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 08:57:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Mar 2026 11:57:50 -0400
Message-Id: <DH02RVPTQ78K.3CPL9LSSI6IIO@etsalapatis.com>
Cc: <loongarch@lists.linux.dev>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next v1 2/2] selftests/bpf: Add alignment flag for
 test_verifier 190 testcase
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Tiezhu Yang" <yangtiezhu@loongson.cn>, "Alexei Starovoitov"
 <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii
 Nakryiko" <andrii@kernel.org>, "Hengqi Chen" <hengqi.chen@gmail.com>
X-Mailer: aerc 0.20.1
References: <20260310064507.4228-1-yangtiezhu@loongson.cn>
 <20260310064507.4228-3-yangtiezhu@loongson.cn>
In-Reply-To: <20260310064507.4228-3-yangtiezhu@loongson.cn>

On Tue Mar 10, 2026 at 2:45 AM EDT, Tiezhu Yang wrote:
> There exists failure when executing the testcase "./test_verifier 190" if
> CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS is not set on LoongArch.
>
>   #190/p calls: two calls that return map_value with incorrect bool check=
 FAIL
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

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>

> ---
>  tools/testing/selftests/bpf/verifier/calls.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/testing/selftests/bpf/verifier/calls.c b/tools/testing=
/selftests/bpf/verifier/calls.c
> index 86887130a0ef..29e57f0e56c3 100644
> --- a/tools/testing/selftests/bpf/verifier/calls.c
> +++ b/tools/testing/selftests/bpf/verifier/calls.c
> @@ -1521,6 +1521,7 @@
>  	.errstr =3D "R0 invalid mem access 'scalar'",
>  	.result_unpriv =3D REJECT,
>  	.errstr_unpriv =3D "invalid read from stack R7 off=3D-16 size=3D8",
> +	.flags =3D F_NEEDS_EFFICIENT_UNALIGNED_ACCESS,
>  },
>  {
>  	"calls: two calls that receive map_value via arg=3Dptr_stack_of_caller.=
 test1",

