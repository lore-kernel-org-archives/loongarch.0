Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A38C54652
	for <loongarch@lists.linux.dev>; Fri,  5 Jul 2024 08:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720167448; cv=none; b=Eh4yFvm5dFwbMJMq75w9GGuPKLYFnB2V6/jRWiLC3hsT9hcDbaFPfsQaxF5w6Co8vO0TeqssMLJnlVsFGDrLYO6frvl8WKzurFgH0+wDbRweoFDpy8kldYjZSE86uAQTNpZs/r1kzYu8m76rAzAfPWbupukYY1R/BbAt3qICK+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720167448; c=relaxed/simple;
	bh=k5hKYMpK350fWSBFrhuiU216jTabEoDlXMzzmkTopgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dPyiZsrP7lp4MWE63lbarD86eukNfN7Y5Nq/F7ZkH+S9MvjypszS3B/pFeNpY6gs0ty7EBmcT5o9iwsABP2YJtblMBH6vLL6z0r4RLok+xVEyRL0UVYGSUGEhUMEXd3SKxQ4AmETXlPg0DgcVc+vv+TaYQAOO7N9oA+dtfrXcA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z5ULfPcw; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z5ULfPcw"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-70af4868d3dso951890b3a.3
        for <loongarch@lists.linux.dev>; Fri, 05 Jul 2024 01:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720167446; x=1720772246; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pzfKlM/Vn4uJrrvE1tXg7/xNfMnv4vE3PiH11TPIKHk=;
        b=Z5ULfPcwuqdpXp8SFx//qogwbYomdTzg86Rs/Fq4FY89e35/Uuu9X95fFuA0r9TMjQ
         lp5B1bk0xXaiqKKK5UTMrg9FAOmp2ZCMtgAjyUlyzRsR3TxSNQXns/U4shr8hs3IHi2s
         pOKl7/oZYZqsnV+N+i43PsByJ7sevJVFRewHH2pALil091r8knmS642Rqk1MLdiinUGk
         DnytSDXrmfHyE8QKStFmRG8xGBEUy8bGmX0lS5MwUZ2lVJ53wPZylXt+M23XRk8huOMi
         NCWlP6PRqklXoaye0luGZjuJUS8v0MubHD+VkWzHSYg5HN34reQeCbmcqeioa9NwKox5
         Dytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720167446; x=1720772246;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pzfKlM/Vn4uJrrvE1tXg7/xNfMnv4vE3PiH11TPIKHk=;
        b=IfEe6DRISquY0CSlTIPf2oMvY1wJmNrpHE6q59lNseMPXbvCklQKtg2+2SUIhkWUKO
         xLWzBieZJ11Dr8QXKwsWWZu7x8PzYyigsMOE/x9Pwv/kcrH77P6SLzK43ADrel7zZNUo
         IKzBGl2Jgov7Ry5O19SyNItIzUNXUmszTAu/hVhzHUjzD7OH5909FJJvtNUKo0xuq7zv
         0m3HVjM8HhALTsf01E7uP5aEqn9YnsNv97MifCMskMD78h0KieArJLoXEi8EhUERdTOM
         B4hylBE5vNCIhtgmpmgx80xuFtjEfPRSjEukuRGI/hSzPPW2ISPgoWvy91libJS0CMx5
         hRLw==
X-Forwarded-Encrypted: i=1; AJvYcCUdfU2Ma9dfuu72RmXkB4aQwv5xrwqk8Z+WaWttS/KPYfa+I7PqUhNo8mnog2xBMERiMh4dovjIBSKppomyg3Pgu8mrKcDQdx6I
X-Gm-Message-State: AOJu0YxxcqjNJyO1YfU29/vG/u1WYlU5uZvhVnv0bvtAzrkJTCD5IoCZ
	biGjYgRVX1Um7id/+1Ca8q+hmzBhyxI4+HjtlzLjDbViMfk5ZZD8X+TEEScecR4=
X-Google-Smtp-Source: AGHT+IH/Ok6sP+JdlabYWPmIV0ie4eKlTtC1WvqWC6Ox5nuRQtOPolIcc8ZRY7CawjQpGL835UjUPA==
X-Received: by 2002:a05:6a20:748b:b0:1bd:2368:829e with SMTP id adf61e73a8af0-1c0cc73b1e9mr4206880637.5.1720167445835;
        Fri, 05 Jul 2024 01:17:25 -0700 (PDT)
Received: from localhost ([122.172.82.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c99a984507sm2815912a91.32.2024.07.05.01.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 01:17:25 -0700 (PDT)
Date: Fri, 5 Jul 2024 13:47:23 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>,
	"Rafael J . Wysocki" <rafael@kernel.org>, loongarch@lists.linux.dev,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: Re: [PATCH V3 2/2] cpufreq: Add Loongson-3 CPUFreq driver support
Message-ID: <20240705081723.6y23ts757aunwyhi@vireshk-i7>
References: <20240705060650.243497-1-chenhuacai@loongson.cn>
 <20240705060650.243497-3-chenhuacai@loongson.cn>
 <20240705071313.ddl6geg72t4n7j3s@vireshk-i7>
 <CAAhV-H5q5hv2sA7EAm1D1nmbG-VGPzc4kpTnHMDSFuFiTKEH7A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAhV-H5q5hv2sA7EAm1D1nmbG-VGPzc4kpTnHMDSFuFiTKEH7A@mail.gmail.com>

On 05-07-24, 15:34, Huacai Chen wrote:
> It seems except changing mutex_init to devm_mutex_init, all other
> changes are line breaks? If so, I think additional tests are
> unnecessary. :)

Yeah, I just wanted to make sure the build passes and I have not
introduced a stupid bug.

> But now long lines (> 80 columns) are accepted by checkpatch.pl. Even
> with --strict, only > 100 columns are warned.
> 
> Especially for the change in loongson3_cpufreq_cpu_exit(), there is
> only 82 columns and I think that line can keep as the original state.
> And if possible, I also want the devm_kzalloc() line keep as original.

Fair enough. I am still hung on 80 columns I believe, but I shouldn't
be as the kernel has moved on :)

New diff (Prototype of exit() callback has changed in my tree, so a
change for that too).

diff --git a/drivers/cpufreq/loongson3_cpufreq.c b/drivers/cpufreq/loongson3_cpufreq.c
index a530e4a56b78..5f79b6de127c 100644
--- a/drivers/cpufreq/loongson3_cpufreq.c
+++ b/drivers/cpufreq/loongson3_cpufreq.c
@@ -31,10 +31,10 @@ union smc_message {
 };
 
 /* Command return values */
-#define CMD_OK				0  /* No error */
-#define CMD_ERROR			1  /* Regular error */
-#define CMD_NOCMD			2  /* Command does not support */
-#define CMD_INVAL			3  /* Invalid Parameter */
+#define CMD_OK				0 /* No error */
+#define CMD_ERROR			1 /* Regular error */
+#define CMD_NOCMD			2 /* Command does not support */
+#define CMD_INVAL			3 /* Invalid Parameter */
 
 /* Version commands */
 /*
@@ -230,7 +230,8 @@ static int loongson3_cpufreq_target(struct cpufreq_policy *policy, unsigned int
 {
 	int ret;
 
-	ret = do_service_request(cpu_data[policy->cpu].core, FREQ_INFO_TYPE_LEVEL, CMD_SET_FREQ_INFO, index, 0);
+	ret = do_service_request(cpu_data[policy->cpu].core,
+				 FREQ_INFO_TYPE_LEVEL, CMD_SET_FREQ_INFO, index, 0);
 
 	return (ret >= 0) ? 0 : ret;
 }
@@ -310,13 +311,11 @@ static int loongson3_cpufreq_cpu_init(struct cpufreq_policy *policy)
 	return 0;
 }
 
-static int loongson3_cpufreq_cpu_exit(struct cpufreq_policy *policy)
+static void loongson3_cpufreq_cpu_exit(struct cpufreq_policy *policy)
 {
 	int cpu = policy->cpu;
 
 	loongson3_cpufreq_target(policy, per_cpu(freq_data, cpu)->def_freq_level);
-
-	return 0;
 }
 
 static int loongson3_cpufreq_cpu_online(struct cpufreq_policy *policy)
@@ -348,13 +347,14 @@ static int loongson3_cpufreq_probe(struct platform_device *pdev)
 	int i, ret;
 
 	for (i = 0; i < MAX_PACKAGES; i++)
-		mutex_init(&cpufreq_mutex[i]);
+		devm_mutex_init(&pdev->dev, &cpufreq_mutex[i]);
 
 	ret = do_service_request(0, 0, CMD_GET_VERSION, 0, 0);
 	if (ret <= 0)
 		return -EPERM;
 
-	ret =  do_service_request(FEATURE_DVFS, 0, CMD_SET_FEATURE, FEATURE_DVFS_ENABLE | FEATURE_DVFS_BOOST, 0);
+	ret = do_service_request(FEATURE_DVFS, 0, CMD_SET_FEATURE,
+				 FEATURE_DVFS_ENABLE | FEATURE_DVFS_BOOST, 0);
 	if (ret < 0)
 		return -EPERM;
 

Applied the patch. You need to take 1/2 through the arch specific
tree. Thanks.

-- 
viresh
