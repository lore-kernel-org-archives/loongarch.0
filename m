Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5C425393E
	for <loongarch@lists.linux.dev>; Fri, 16 Oct 2026 15:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792163916; cv=none; b=Gcj2eKWjI2R1jxH6ER8EbDYuv0/hcWnTchtm1dcP4929JjwnFk3omar9Dp7v44MMf5d9aZGO3ghjpQCPA5HduHarBD6XH6NA5DzKztvVc9Bz1zNWDzKBM1ZeCSVQoQ4bsIM6OR2WEH/C0brlVDCzMZ6SuUSpOjeRHwp7lsZcf5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792163916; c=relaxed/simple;
	bh=O2RzggFs1bjfXctsFTnmjze2UQnPIPO+HIGT6FFRaHE=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:In-Reply-To:
	 References:MIME-Version; b=IE0+eB7g4GRPBaLyqZn8475TWGdsD83oF4pCvhw5CCTI5FWTPoShGnq5OiH2EealXEyR6AKSA6K9yQun9Jji0c99mmuDl7qVmIggopsiCTTMoQXrchQqGxV0wvN5yPczYxZFYI7iXxoqDR3AsIBt01YJb01GOXuBc/WCZLaYzlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P7aw7J8z; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P7aw7J8z"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cd5e2d696e0so54492a12.1
        for <loongarch@lists.linux.dev>; Fri, 16 Oct 2026 08:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792163915; x=1792768715; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O2RzggFs1bjfXctsFTnmjze2UQnPIPO+HIGT6FFRaHE=;
        b=P7aw7J8zII4u0hoxqYyLuL5ILVImMHsapabGOIveOsKzepI8ed4K66dWIHm9vaQlpg
         CbLqoGZCPi5Q47ey8JkP1FgqIodGPIzQGR+Z+xs/M2//PjK6dp3j7YXY68eBa9KNLFeR
         evHqkWgU8tO3gcYVry30KePJ0354x/x/LJPAgnAmSkihPFHGNAhNPcp00rIX4dr4NFVv
         FjE2musqo/tfIg84aQKCS9YCPYCiY1mRWlCZ2FslqnRUhCgg3zofhl/wEFqUvtvDl+Nn
         djPGNl7wPLFVMipnZJKvj+4L0LAqIiNwFyejAJ2FhCfJOzVVCyJTtHEt64CURYJWGhc+
         czjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792163915; x=1792768715;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O2RzggFs1bjfXctsFTnmjze2UQnPIPO+HIGT6FFRaHE=;
        b=X8/8xs6HkOKGU05OskoTuNZVGG8Xbk458y7NOcA/zrsa6sdmy0CKfRdV+e0Lef05nb
         cP7bwBYUKAkdPMNl3MAxbSOmBfBIj1pfxCQ63ZX5+UIYv4l8flzjdIusCbvV9JNU3wf1
         Nv6Zw8gDwjS77TxC7HGQYPRkVLIn2+OuGAL2ScgyY0YR6rfy3Bb22CHiz2aYoAKP+gJq
         uAKpaTNhZg7iHIa0mkXJn9pe3XXK5bPqJjQLvKtoadIRySCtYFRoqpdJ+ATyTEHj5Mo7
         FIrqMoblQzbdWDbY/Gihe6XzH4fyDh20f8cA08IGPRG3755/w3G4p7VhKAH6K7vGuN5N
         fiKQ==
X-Gm-Message-State: AFq9FYKfV4sMbQ/HJU/HZ/qUsLy8QmXPi1O0zNtqfVW/8QCArr+6PdZR
	qUQ7NUBjC7GoXxofGJ06TGeRZzYeDeTif+S/DMuiOcwSPJGxW/V7rLi7
X-Gm-Gg: AYBFou04u7V5PuRWUYQ2WIRKFaL5TR0jf6UCFWJCaCeKuQAzU+JDWi+/K1bpuIdI6km
	wBJ3Gl7pOWxztv/PX0CtnqY7fBSa21AIpDRQu1EGoecw4UuxpodPOOVnsTLlobDQONvi1sGUmci
	bR3WNdtykJ/SDzvAsqOIykQtzzCVRgUpAt9/lqKcccbLyEJwtVJaHz4VKSyoeRP3cn16WX2xsgT
	18FlIOV9pvxQ0OuVzAfWNFLrYsuDOtQb/dpF9yI0FKKa+cnOlIbev4BQS9461SBQF6mjVCPpw0u
	kWbMlCpLaDL87BuSJ6LrhEBzcxTFCv2sDbkZ2dRToezbr3PR3Ub7WQdJcp2ALeeCHVxpn8y0A5n
	E0EvJFm9LEnpNzEl8+imeXoLDzmL9mfoFT5FmKFTWmbPG6IrNeThsfc5k9AghyHV4BGMZqoG0RV
	CwLAseatvddxcH4dCI6c5W6xiKF3BGJmCqTe+snIG9OeQHSrM15szRTfpOLUGSmN0DHzIwdmIGy
	VBRDEfR2KN88fO6osxpzvMU/oWDiGbOW8e39kcfs1oBvmID1TcqbZN4yRV3lhVlzGyzCSHjBbtU
	27M=
X-Received: by 2002:a17:90b:3889:b0:3ac:95d7:2fa5 with SMTP id 98e67ed59e1d1-3acef1545d3mr137430a91.44.1792163914509;
        Fri, 16 Oct 2026 08:18:34 -0700 (PDT)
Received: from localhost ([153.61.198.253])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd403c212sm1472146a91.4.2026.10.16.08.18.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 08:18:33 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Oct 2026 15:18:33 +0000
Message-Id: <DM6D33SL63BR.HOFSY6JUHO44@gmail.com>
Subject: Re: [PATCH v3 3/3] LoongArch: BPF: Optimize 32-bit operations using
 native instructions
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Tiezhu Yang" <yangtiezhu@loongson.cn>, "Huacai Chen"
 <chenhuacai@kernel.org>, "Hengqi Chen" <hengqi.chen@gmail.com>
Cc: <loongarch@lists.linux.dev>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
In-Reply-To: <20261016081006.26069-4-yangtiezhu@loongson.cn>
References: <20261016081006.26069-1-yangtiezhu@loongson.cn> <20261016081006.26069-4-yangtiezhu@loongson.cn>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Fri, Oct 16, 2026 at 04:10 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:

> All of the testcases of test_bpf passed on Loongson-3A6000 (with DIV32)
> and Loongson-3A5000 (without DIV32), here are the test results:

fyi test_bpf is gone. See
commit 4532e525b286 ("selftests/bpf: Remove the old test_bpf module").
Pls run test_progs
