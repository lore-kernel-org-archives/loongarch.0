Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950DE749E
	for <loongarch@lists.linux.dev>; Thu,  8 Jun 2023 07:47:31 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-30ae95c4e75so296987f8f.2
        for <loongarch@lists.linux.dev>; Thu, 08 Jun 2023 00:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686210450; x=1688802450;
        h=content-transfer-encoding:cc:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pKpO5ItYiMJJEW+sejs/pUx6xuufVOGsXiL4H+U2QwY=;
        b=VRapvNbs5TXGVO1BxVueVxAZD0DTuxkR7z+FFcdZQ/M4+d2mDQcPgQBG+rk4w3CiMJ
         n5DGxnLn5UYVzwS3kqnNYZW2EBiaZDLyrrqZ2kKur2Gq/TlX4T2S1//Gcm+r6hZjL8R9
         LOaDcZUftcq+xcSn43bZt4NN+oFznjt1EMPIXdu/iFo4un+jotj1GY61o0h94paoobTk
         K3GyC8q03HLXlkXk4UzzjmzF54ihv6AoE9mZo0pdUSp2u/7ej6V9rULUnkQsNesmSpc8
         q86ux17YDjsKVl7KnD4SwxIvalG699Pl2hib4Oi+a5KOBKEdkIReMu5+Cqbltq9TSt/v
         1q5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686210450; x=1688802450;
        h=content-transfer-encoding:cc:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pKpO5ItYiMJJEW+sejs/pUx6xuufVOGsXiL4H+U2QwY=;
        b=etCkSPCD0q0Os3yM/+xIqqkcRK0H5rL0LnJP8o0j96L8hGjMg0k6oQODKjJQERNgf0
         gFGvui1AzBjkN6DTmSlNzKGjlDNl0Q08S6TEHZOqItdlKWPhAKSnFr8J08K5sZmfXTV4
         gCANkaO9hI6r1IFJh20UlLQo6Ez72iR3loz+9oOLIeXk8xdZhZRqVJB06VMl9vxJKl2s
         nl7GqL2BEsFZHDYQO0x0CCP1eyH/jh2C0h7OJvLmz78FG6YnT6hls+k94tQtILMavjej
         WlBxFz+g/ZBLvnR+XM3grozSKTaUP8uMKElmhO4LuFkGLhKGn0DYikYB+geysSMeExaN
         rm9A==
X-Gm-Message-State: AC+VfDwkJmXbbyhjvnGEkYKmCIgGyzxtMejOVZSUhED6fHD8lOq64OKS
	BFVyjTcn2m6u1ODQyHvby3I=
X-Google-Smtp-Source: ACHHUZ7FLCvn48wU8ttK/wqkrjcYnTcAakUdl/pruduaGLnlji9N1PUvK/8kk/UjPBh0vzwGCI0Ciw==
X-Received: by 2002:a05:6000:4f:b0:306:41d3:fcb9 with SMTP id k15-20020a056000004f00b0030641d3fcb9mr6440745wrx.27.1686210449445;
        Thu, 08 Jun 2023 00:47:29 -0700 (PDT)
Received: from [192.168.0.210] (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.googlemail.com with ESMTPSA id x4-20020a05600c21c400b003f72d7dc66esm1082613wmj.13.2023.06.08.00.47.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 00:47:28 -0700 (PDT)
Message-ID: <f0265d75-d0e9-9f03-c730-dcc32fcccc69@gmail.com>
Date: Thu, 8 Jun 2023 08:47:27 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Qing Zhang <zhangqing@loongson.cn>, loongarch@lists.linux.dev
From: "Colin King (gmail)" <colin.i.king@gmail.com>
Subject: re: LoongArch: Add hardware breakpoints/watchpoints support
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Static analysis with cppcheck has found an issue in 
arch/loongarch/kernel/hw_breakpoint.c function hw_breakpoint_arch_parse 
with the following commit:

commit edffa33c7bb5a73e90c754c7a497162b77d7c55f
Author: Qing Zhang <zhangqing@loongson.cn>
Date:   Sat Feb 25 15:52:57 2023 +0800

     LoongArch: Add hardware breakpoints/watchpoints support


/*
  * Validate the arch-specific HW Breakpoint register settings.
  */
int hw_breakpoint_arch_parse(struct perf_event *bp,
                              const struct perf_event_attr *attr,
                              struct arch_hw_breakpoint *hw)
{
         int ret;
         u64 alignment_mask, offset;

^^ alignment mask is not initialized

         /* Build the arch_hw_breakpoint. */
         ret = arch_build_bp_info(bp, attr, hw);
         if (ret)
                 return ret;

         if (hw->ctrl.type != LOONGARCH_BREAKPOINT_EXECUTE)
                 alignment_mask = 0x7;
^^ only on this if path is alignment_mask being assigned

         offset = hw->address & alignment_mask;
         hw->address &= ~alignment_mask;

^^ offset and hw->address being modified by potentially uninitialized 
alignment_mask

         hw->ctrl.len <<= offset;

         return 0;
}


Regards,

Colin



