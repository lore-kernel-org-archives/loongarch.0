Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 770B518E02D;
	Mon,  6 Jan 2025 08:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736153969; cv=none; b=uNE1FwdLrQtACSuhRXxhqzD+7BOp5sH/bWZ294lpXkzlATEWBcHBjVTy5pcwzQ9Vl3PgEi+EiWHa0midwjqFbbKdnI243NIguEg/3kZVlN5li+eMgzYuZHaVsr/JCyW3a/c+QQo+nV2/tV0qypPR87K7vw8L6CzuJoTIIIIEO3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736153969; c=relaxed/simple;
	bh=lyt25+sfC5biFDvFRDF7m2VCHdAKBZ4jBAP4Xw9WBPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QnB9AcdRZv3s1EfFFDXlr0QNf7Aok97RCfE+RrvUP2a6hlId6KGOQql9lWzny0I729DG+REigUYfVhEFQyZSBMFvs2oWC9p86sAeQSGaq2WHFs/7GCqCxDcoCyylg+3TUlWMkUVm6LmQcwiOmseKKpfjhVMC5XNzcCnZPynH5Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Axfaxgm3tnjY5eAA--.538S3;
	Mon, 06 Jan 2025 16:59:12 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMDxfcdXm3tnVkgWAA--.31668S2;
	Mon, 06 Jan 2025 16:59:03 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Xinhui Pan <Xinhui.Pan@amd.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	loongarch@lists.linux.dev,
	amd-gfx@lists.freedesktop.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] drm/amd/display: Replace ASSERT() with ASSERT_WARN()
Date: Mon,  6 Jan 2025 16:59:00 +0800
Message-ID: <20250106085901.3768-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250106085755.3268-1-yangtiezhu@loongson.cn>
References: <20250106085755.3268-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMDxfcdXm3tnVkgWAA--.31668S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9kXoW8JFW3Zr13CrWfGr4rWw1DKr1xp5X_Wry8Cr
	ykpw4xJ34jqw4UAF1vyasrX3W8uF4ru34kJFWfK393u3sI9a43AryDXFs7GrW5CFW5KFWD
	Zw1ftFn8GrW7JFnayFcCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUUBIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x02
	67AKxVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804V
	CY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AK
	xVWUtVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48Icx
	kI7VAKI48JMxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCj
	c4AY6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
	Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY
	6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6x
	AIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY
	1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8EPfPUUUUU==

ASSERT() is actually ASSERT_WARN() according to the macro definition
in drivers/gpu/drm/amd/display/dc/os_types.h, just replace the macro
name ASSERT() with explicit ASSERT_WARN() to avoid ambiguous.

Here is the one-line script:

  sed -i "s/\<ASSERT\>/ASSERT_WARN/g" `grep ASSERT -rwl drivers/gpu/drm/amd/display`

This is in preparation to add ASSERT_BUG() in later patch to harden
the callers of division functions, no functional change intended.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  4 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   |  8 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  2 +-
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  2 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  2 +-
 .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.c    |  2 +-
 .../gpu/drm/amd/display/dc/basics/bw_fixed.c  | 18 ++---
 .../gpu/drm/amd/display/dc/basics/dce_calcs.c |  2 +-
 .../drm/amd/display/dc/basics/fixpt31_32.c    | 28 +++----
 .../drm/amd/display/dc/bios/bios_parser2.c    |  6 +-
 .../amd/display/dc/bios/bios_parser_common.c  |  2 +-
 .../gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c  |  2 +-
 .../display/dc/clk_mgr/dce100/dce_clk_mgr.c   |  4 +-
 .../dc/clk_mgr/dce110/dce110_clk_mgr.c        |  4 +-
 .../display/dc/clk_mgr/dcn10/rv1_clk_mgr.c    |  2 +-
 .../dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.c  |  2 +-
 .../amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c |  8 +-
 .../dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.c   |  6 +-
 .../display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c  |  2 +-
 .../display/dc/clk_mgr/dcn301/dcn301_smu.c    |  2 +-
 .../display/dc/clk_mgr/dcn301/vg_clk_mgr.c    | 10 +--
 .../display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c  | 12 +--
 .../amd/display/dc/clk_mgr/dcn31/dcn31_smu.c  |  4 +-
 .../dc/clk_mgr/dcn314/dcn314_clk_mgr.c        | 14 ++--
 .../display/dc/clk_mgr/dcn314/dcn314_smu.c    |  4 +-
 .../dc/clk_mgr/dcn315/dcn315_clk_mgr.c        | 14 ++--
 .../display/dc/clk_mgr/dcn315/dcn315_smu.c    |  2 +-
 .../dc/clk_mgr/dcn316/dcn316_clk_mgr.c        | 12 +--
 .../display/dc/clk_mgr/dcn316/dcn316_smu.c    |  2 +-
 .../display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c  |  2 +-
 .../display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c  | 18 ++---
 .../amd/display/dc/clk_mgr/dcn35/dcn35_smu.c  |  6 +-
 .../dc/clk_mgr/dcn401/dcn401_clk_mgr.c        | 10 +--
 drivers/gpu/drm/amd/display/dc/core/dc.c      | 24 +++---
 .../drm/amd/display/dc/core/dc_hw_sequencer.c |  4 +-
 .../drm/amd/display/dc/core/dc_link_enc_cfg.c | 12 +--
 .../gpu/drm/amd/display/dc/core/dc_resource.c | 62 ++++++++--------
 drivers/gpu/drm/amd/display/dc/core/dc_stat.c |  4 +-
 .../gpu/drm/amd/display/dc/core/dc_stream.c   |  2 +-
 .../gpu/drm/amd/display/dc/core/dc_surface.c  |  2 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c  |  6 +-
 drivers/gpu/drm/amd/display/dc/dc_helper.c    |  8 +-
 .../amd/display/dc/dccg/dcn20/dcn20_dccg.c    |  2 +-
 .../amd/display/dc/dccg/dcn31/dcn31_dccg.c    |  2 +-
 .../amd/display/dc/dccg/dcn35/dcn35_dccg.c    |  4 +-
 .../amd/display/dc/dccg/dcn401/dcn401_dccg.c  |  2 +-
 .../gpu/drm/amd/display/dc/dce/dce_audio.c    |  6 +-
 .../gpu/drm/amd/display/dc/dce/dce_clk_mgr.c  |  8 +-
 .../drm/amd/display/dc/dce/dce_clock_source.c |  2 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_dmcu.c |  2 +-
 .../gpu/drm/amd/display/dc/dce/dce_i2c_sw.c   |  2 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_ipp.c  |  4 +-
 .../drm/amd/display/dc/dce/dce_link_encoder.c |  8 +-
 .../drm/amd/display/dc/dce/dce_mem_input.c    |  6 +-
 .../amd/display/dc/dce/dce_stream_encoder.c   | 10 +--
 .../drm/amd/display/dc/dce/dce_transform.c    |  8 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c |  4 +-
 .../gpu/drm/amd/display/dc/dce/dmub_replay.c  |  4 +-
 .../dc/dce110/dce110_timing_generator.c       |  2 +-
 .../amd/display/dc/dce60/dce60_hw_sequencer.c |  2 +-
 .../drm/amd/display/dc/dce60/dce60_resource.c |  2 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_vmid.c |  2 +-
 .../amd/display/dc/dcn21/dcn21_link_encoder.c |  4 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_afmt.c |  2 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_vpg.c  |  2 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_apg.c  |  2 +-
 .../amd/display/dc/dcn31/dcn31_panel_cntl.c   |  2 +-
 .../display/dc/dio/dcn10/dcn10_link_encoder.c |  4 +-
 .../dc/dio/dcn10/dcn10_stream_encoder.c       |  8 +-
 .../dc/dio/dcn20/dcn20_stream_encoder.c       |  4 +-
 .../dc/dio/dcn30/dcn30_dio_stream_encoder.c   | 16 ++--
 .../dc/dio/dcn314/dcn314_dio_stream_encoder.c |  6 +-
 .../dc/dio/dcn32/dcn32_dio_stream_encoder.c   |  6 +-
 .../dc/dio/dcn35/dcn35_dio_stream_encoder.c   |  8 +-
 .../dc/dio/dcn401/dcn401_dio_stream_encoder.c |  8 +-
 drivers/gpu/drm/amd/display/dc/dm_services.h  |  2 +-
 .../amd/display/dc/dml/calcs/dcn_calc_math.c  |  6 +-
 .../drm/amd/display/dc/dml/calcs/dcn_calcs.c  | 18 ++---
 .../drm/amd/display/dc/dml/dcn10/dcn10_fpu.c  |  2 +-
 .../drm/amd/display/dc/dml/dcn20/dcn20_fpu.c  | 14 ++--
 .../dc/dml/dcn20/display_mode_vba_20.c        |  2 +-
 .../dc/dml/dcn20/display_mode_vba_20v2.c      |  2 +-
 .../dc/dml/dcn20/display_rq_dlg_calc_20.c     | 54 +++++++-------
 .../dc/dml/dcn20/display_rq_dlg_calc_20v2.c   | 54 +++++++-------
 .../dc/dml/dcn21/display_mode_vba_21.c        |  2 +-
 .../dc/dml/dcn21/display_rq_dlg_calc_21.c     | 54 +++++++-------
 .../drm/amd/display/dc/dml/dcn30/dcn30_fpu.c  |  4 +-
 .../dc/dml/dcn30/display_mode_vba_30.c        |  4 +-
 .../dc/dml/dcn30/display_rq_dlg_calc_30.c     | 56 +++++++-------
 .../amd/display/dc/dml/dcn301/dcn301_fpu.c    |  6 +-
 .../amd/display/dc/dml/dcn302/dcn302_fpu.c    |  2 +-
 .../amd/display/dc/dml/dcn303/dcn303_fpu.c    |  2 +-
 .../drm/amd/display/dc/dml/dcn31/dcn31_fpu.c  |  6 +-
 .../dc/dml/dcn31/display_mode_vba_31.c        |  4 +-
 .../dc/dml/dcn31/display_rq_dlg_calc_31.c     | 50 ++++++-------
 .../amd/display/dc/dml/dcn314/dcn314_fpu.c    |  6 +-
 .../dc/dml/dcn314/display_mode_vba_314.c      |  4 +-
 .../dc/dml/dcn314/display_rq_dlg_calc_314.c   | 50 ++++++-------
 .../drm/amd/display/dc/dml/dcn32/dcn32_fpu.c  | 32 ++++----
 .../dc/dml/dcn32/display_rq_dlg_calc_32.c     | 58 +++++++--------
 .../amd/display/dc/dml/dcn321/dcn321_fpu.c    |  2 +-
 .../drm/amd/display/dc/dml/dcn35/dcn35_fpu.c  |  4 +-
 .../amd/display/dc/dml/dcn351/dcn351_fpu.c    |  4 +-
 .../drm/amd/display/dc/dml/display_mode_vba.c | 12 +--
 .../display/dc/dml/dml1_display_rq_dlg_calc.c | 74 +++++++++----------
 .../amd/display/dc/dml2/display_mode_core.c   | 14 ++--
 .../amd/display/dc/dml2/display_mode_util.c   | 12 +--
 .../dc/dml2/dml21/dml21_translation_helper.c  | 10 +--
 .../amd/display/dc/dml2/dml21/dml21_utils.c   |  8 +-
 .../amd/display/dc/dml2/dml21/dml21_wrapper.c |  8 +-
 .../lib_float_math.c                          |  4 +-
 .../dc/dml2/dml21/src/inc/dml2_debug.c        |  2 +-
 .../display/dc/dml2/dml2_dc_resource_mgmt.c   | 50 ++++++-------
 .../gpu/drm/amd/display/dc/dml2/dml2_policy.c |  2 +-
 .../display/dc/dml2/dml2_translation_helper.c | 10 +--
 .../gpu/drm/amd/display/dc/dml2/dml2_utils.c  |  6 +-
 .../drm/amd/display/dc/dml2/dml2_wrapper.c    | 10 +--
 .../display/dc/dml2/dml_display_rq_dlg_calc.c | 62 ++++++++--------
 .../amd/display/dc/dpp/dcn10/dcn10_dpp_dscl.c |  4 +-
 .../drm/amd/display/dc/dpp/dcn30/dcn30_dpp.c  |  8 +-
 .../display/dc/dpp/dcn401/dcn401_dpp_dscl.c   |  4 +-
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c   |  4 +-
 .../drm/amd/display/dc/dsc/dcn20/dcn20_dsc.c  | 24 +++---
 .../drm/amd/display/dc/dsc/dcn35/dcn35_dsc.c  |  2 +-
 .../amd/display/dc/dsc/dcn401/dcn401_dsc.c    |  4 +-
 drivers/gpu/drm/amd/display/dc/gpio/hw_gpio.c |  2 +-
 .../dc/hpo/dcn31/dcn31_hpo_dp_link_encoder.c  |  6 +-
 .../hpo/dcn31/dcn31_hpo_dp_stream_encoder.c   |  4 +-
 .../dc/hpo/dcn32/dcn32_hpo_dp_link_encoder.c  |  2 +-
 .../display/dc/hubbub/dcn10/dcn10_hubbub.c    |  4 +-
 .../display/dc/hubbub/dcn20/dcn20_hubbub.c    |  6 +-
 .../display/dc/hubbub/dcn31/dcn31_hubbub.c    |  8 +-
 .../display/dc/hubbub/dcn32/dcn32_hubbub.c    |  8 +-
 .../display/dc/hubbub/dcn35/dcn35_hubbub.c    |  8 +-
 .../display/dc/hubbub/dcn401/dcn401_hubbub.c  | 10 +--
 .../amd/display/dc/hubp/dcn10/dcn10_hubp.c    |  4 +-
 .../amd/display/dc/hubp/dcn20/dcn20_hubp.c    |  4 +-
 .../amd/display/dc/hubp/dcn401/dcn401_hubp.c  |  8 +-
 .../amd/display/dc/hwss/dce110/dce110_hwseq.c |  8 +-
 .../amd/display/dc/hwss/dcn10/dcn10_hwseq.c   |  8 +-
 .../amd/display/dc/hwss/dcn20/dcn20_hwseq.c   | 22 +++---
 .../amd/display/dc/hwss/dcn201/dcn201_hwseq.c |  4 +-
 .../amd/display/dc/hwss/dcn30/dcn30_hwseq.c   | 24 +++---
 .../amd/display/dc/hwss/dcn31/dcn31_hwseq.c   |  4 +-
 .../amd/display/dc/hwss/dcn314/dcn314_hwseq.c | 10 +--
 .../amd/display/dc/hwss/dcn32/dcn32_hwseq.c   | 18 ++---
 .../amd/display/dc/hwss/dcn35/dcn35_hwseq.c   | 10 +--
 .../amd/display/dc/hwss/dcn401/dcn401_hwseq.c |  6 +-
 .../gpu/drm/amd/display/dc/irq/irq_service.c  |  4 +-
 .../display/dc/link/accessories/link_dp_cts.c |  4 +-
 .../amd/display/dc/link/hwss/link_hwss_dio.c  |  2 +-
 .../amd/display/dc/link/hwss/link_hwss_dpia.c |  2 +-
 .../drm/amd/display/dc/link/link_detection.c  |  4 +-
 .../gpu/drm/amd/display/dc/link/link_dpms.c   | 26 +++----
 .../dc/link/protocols/link_dp_capability.c    | 12 +--
 .../display/dc/link/protocols/link_dp_phy.c   |  4 +-
 .../dc/link/protocols/link_dp_training.c      | 14 ++--
 .../link/protocols/link_dp_training_8b_10b.c  |  2 +-
 .../dc/link/protocols/link_dp_training_dpia.c |  4 +-
 .../link_dp_training_fixed_vs_pe_retimer.c    |  4 +-
 .../amd/display/dc/link/protocols/link_dpcd.c |  2 +-
 .../link/protocols/link_edp_panel_control.c   |  6 +-
 .../amd/display/dc/link/protocols/link_hpd.c  |  2 +-
 .../drm/amd/display/dc/mpc/dcn10/dcn10_mpc.c  | 16 ++--
 .../drm/amd/display/dc/mpc/dcn20/dcn20_mpc.c  | 14 ++--
 .../drm/amd/display/dc/opp/dcn20/dcn20_opp.c  |  2 +-
 .../amd/display/dc/optc/dcn10/dcn10_optc.c    |  2 +-
 .../amd/display/dc/optc/dcn20/dcn20_optc.c    |  2 +-
 .../amd/display/dc/optc/dcn201/dcn201_optc.c  |  2 +-
 .../amd/display/dc/optc/dcn30/dcn30_optc.c    |  2 +-
 .../amd/display/dc/optc/dcn31/dcn31_optc.c    |  2 +-
 .../amd/display/dc/optc/dcn35/dcn35_optc.c    |  2 +-
 .../amd/display/dc/optc/dcn401/dcn401_optc.c  |  4 +-
 drivers/gpu/drm/amd/display/dc/os_types.h     |  2 +-
 .../dc/resource/dce100/dce100_resource.c      |  2 +-
 .../dc/resource/dce110/dce110_resource.c      |  2 +-
 .../dc/resource/dce112/dce112_resource.c      |  2 +-
 .../dc/resource/dce120/dce120_resource.c      |  2 +-
 .../dc/resource/dce80/dce80_resource.c        |  2 +-
 .../dc/resource/dcn10/dcn10_resource.c        |  4 +-
 .../dc/resource/dcn20/dcn20_resource.c        | 30 ++++----
 .../dc/resource/dcn201/dcn201_resource.c      |  2 +-
 .../dc/resource/dcn21/dcn21_resource.c        | 12 +--
 .../dc/resource/dcn30/dcn30_resource.c        | 26 +++----
 .../dc/resource/dcn31/dcn31_resource.c        |  4 +-
 .../dc/resource/dcn314/dcn314_resource.c      |  2 +-
 .../dc/resource/dcn315/dcn315_resource.c      |  4 +-
 .../dc/resource/dcn316/dcn316_resource.c      |  6 +-
 .../dc/resource/dcn32/dcn32_resource.c        | 20 ++---
 .../dc/resource/dcn321/dcn321_resource.c      |  6 +-
 .../dc/resource/dcn35/dcn35_resource.c        |  2 +-
 .../dc/resource/dcn351/dcn351_resource.c      |  2 +-
 .../dc/resource/dcn401/dcn401_resource.c      |  6 +-
 .../gpu/drm/amd/display/dmub/src/dmub_srv.c   |  4 +-
 .../gpu/drm/amd/display/include/fixed31_32.h  | 12 +--
 .../amd/display/modules/color/color_gamma.c   |  2 +-
 .../amd/display/modules/freesync/freesync.c   |  4 +-
 .../amd/display/modules/power/power_helpers.c |  8 +-
 .../gpu/drm/amd/display/modules/vmid/vmid.c   |  2 +-
 199 files changed, 916 insertions(+), 916 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 48be917e7bc5..bb21ba8c4178 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -8150,7 +8150,7 @@ void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
 	case DRM_MODE_CONNECTOR_DisplayPort:
 		aconnector->base.polled = DRM_CONNECTOR_POLL_HPD;
 		link->link_enc = link_enc_cfg_get_link_enc(link);
-		ASSERT(link->link_enc);
+		ASSERT_WARN(link->link_enc);
 		if (link->link_enc)
 			aconnector->base.ycbcr_420_allowed =
 			link->link_enc->features.dp_ycbcr420_supported ? true : false;
@@ -12356,7 +12356,7 @@ uint32_t dm_read_reg_func(const struct dc_context *ctx, uint32_t address,
 	if (ctx->dmub_srv &&
 	    ctx->dmub_srv->reg_helper_offload.gather_in_progress &&
 	    !ctx->dmub_srv->reg_helper_offload.should_burst_write) {
-		ASSERT(false);
+		ASSERT_WARN(false);
 		return 0;
 	}
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index ebabfe3a512f..b298ce8b5fe5 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -488,7 +488,7 @@ static int __set_legacy_tf(struct dc_transfer_func *func,
 	struct calculate_buffer cal_buffer = {0};
 	bool res;
 
-	ASSERT(lut && lut_size == MAX_COLOR_LEGACY_LUT_ENTRIES);
+	ASSERT_WARN(lut && lut_size == MAX_COLOR_LEGACY_LUT_ENTRIES);
 
 	cal_buffer.buffer_index = -1;
 
@@ -529,7 +529,7 @@ static int __set_output_tf(struct dc_transfer_func *func,
 	cal_buffer.buffer_index = -1;
 
 	if (lut_size) {
-		ASSERT(lut && lut_size == MAX_COLOR_LUT_ENTRIES);
+		ASSERT_WARN(lut && lut_size == MAX_COLOR_LUT_ENTRIES);
 
 		gamma = dc_create_gamma();
 		if (!gamma)
@@ -1032,7 +1032,7 @@ map_crtc_degamma_to_dc_plane(struct dm_crtc_state *crtc,
 	if (crtc->cm_has_degamma) {
 		degamma_lut = __extract_blob_lut(crtc->base.degamma_lut,
 						 &degamma_size);
-		ASSERT(degamma_size == MAX_COLOR_LUT_ENTRIES);
+		ASSERT_WARN(degamma_size == MAX_COLOR_LUT_ENTRIES);
 
 		dc_plane_state->in_transfer_func.type = TF_TYPE_DISTRIBUTED_POINTS;
 
@@ -1117,7 +1117,7 @@ __set_dm_plane_degamma(struct drm_plane_state *plane_state,
 	dc_plane_state->in_transfer_func.tf = amdgpu_tf_to_dc_tf(tf);
 
 	if (has_degamma_lut) {
-		ASSERT(degamma_size == MAX_COLOR_LUT_ENTRIES);
+		ASSERT_WARN(degamma_size == MAX_COLOR_LUT_ENTRIES);
 
 		dc_plane_state->in_transfer_func.type =
 			TF_TYPE_DISTRIBUTED_POINTS;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index 6cbbb71d752b..c0d3da240050 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -196,7 +196,7 @@ fill_dc_mst_payload_table_from_drm(struct dc_link *link,
 				break;
 			}
 		}
-		ASSERT(i != copy_of_link_table.stream_count);
+		ASSERT_WARN(i != copy_of_link_table.stream_count);
 	}
 
 	/* Fill payload info*/
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 6e4359490613..0a40db09310e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -1191,7 +1191,7 @@ static int compute_mst_dsc_configs_for_link(struct drm_atomic_state *state,
 	DRM_DEBUG_DRIVER("%s: MST_DSC Params set up for %d streams\n", __func__, count);
 
 	if (count == 0) {
-		ASSERT(0);
+		ASSERT_WARN(0);
 		return 0;
 	}
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 495e3cd70426..2bebe49a5b92 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -639,7 +639,7 @@ static void amdgpu_dm_plane_add_gfx11_modifiers(struct amdgpu_device *adev,
 	 * adev->gfx.config.gb_addr_config_fields.num_{pkrs,pipes}
 	 */
 	gb_addr_config = RREG32_SOC15(GC, 0, regGB_ADDR_CONFIG);
-	ASSERT(gb_addr_config != 0);
+	ASSERT_WARN(gb_addr_config != 0);
 
 	num_pkrs = 1 << REG_GET_FIELD(gb_addr_config, GB_ADDR_CONFIG, NUM_PKRS);
 	pkrs = ilog2(num_pkrs);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
index e46f8ce41d87..b237208617b4 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
@@ -55,7 +55,7 @@ inline void dc_assert_fp_enabled(void)
 
 	depth = __this_cpu_read(fpu_recursion_depth);
 
-	ASSERT(depth >= 1);
+	ASSERT_WARN(depth >= 1);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/display/dc/basics/bw_fixed.c b/drivers/gpu/drm/amd/display/dc/basics/bw_fixed.c
index c8cb89e0d4d0..a1b6120525e4 100644
--- a/drivers/gpu/drm/amd/display/dc/basics/bw_fixed.c
+++ b/drivers/gpu/drm/amd/display/dc/basics/bw_fixed.c
@@ -50,7 +50,7 @@ struct bw_fixed bw_int_to_fixed_nonconst(int64_t value)
 {
 	struct bw_fixed res;
 
-	ASSERT(value < BW_FIXED_MAX_I32 && value > BW_FIXED_MIN_I32);
+	ASSERT_WARN(value < BW_FIXED_MAX_I32 && value > BW_FIXED_MIN_I32);
 	res.value = value << BW_FIXED_BITS_PER_FRACTIONAL_PART;
 	return res;
 }
@@ -67,13 +67,13 @@ struct bw_fixed bw_frc_to_fixed(int64_t numerator, int64_t denominator)
 	/* determine integer part */
 	uint64_t res_value;
 
-	ASSERT(denominator != 0);
+	ASSERT_WARN(denominator != 0);
 
 	arg1_value = abs_i64(numerator);
 	arg2_value = abs_i64(denominator);
 	res_value = div64_u64_rem(arg1_value, arg2_value, &remainder);
 
-	ASSERT(res_value <= BW_FIXED_MAX_I32);
+	ASSERT_WARN(res_value <= BW_FIXED_MAX_I32);
 
 	/* determine fractional part */
 	{
@@ -95,7 +95,7 @@ struct bw_fixed bw_frc_to_fixed(int64_t numerator, int64_t denominator)
 	{
 		uint64_t summand = (remainder << 1) >= arg2_value;
 
-		ASSERT(res_value <= MAX_I64 - summand);
+		ASSERT_WARN(res_value <= MAX_I64 - summand);
 
 		res_value += summand;
 	}
@@ -115,7 +115,7 @@ struct bw_fixed bw_floor2(const struct bw_fixed arg,
 
 	multiplicand = div64_s64(arg.value, abs_i64(significance.value));
 	result.value = abs_i64(significance.value) * multiplicand;
-	ASSERT(abs_i64(result.value) <= abs_i64(arg.value));
+	ASSERT_WARN(abs_i64(result.value) <= abs_i64(arg.value));
 	return result;
 }
 
@@ -156,19 +156,19 @@ struct bw_fixed bw_mul(const struct bw_fixed arg1, const struct bw_fixed arg2)
 
 	res.value = arg1_int * arg2_int;
 
-	ASSERT(res.value <= BW_FIXED_MAX_I32);
+	ASSERT_WARN(res.value <= BW_FIXED_MAX_I32);
 
 	res.value <<= BW_FIXED_BITS_PER_FRACTIONAL_PART;
 
 	tmp = arg1_int * arg2_fra;
 
-	ASSERT(tmp <= (uint64_t)(MAX_I64 - res.value));
+	ASSERT_WARN(tmp <= (uint64_t)(MAX_I64 - res.value));
 
 	res.value += tmp;
 
 	tmp = arg2_int * arg1_fra;
 
-	ASSERT(tmp <= (uint64_t)(MAX_I64 - res.value));
+	ASSERT_WARN(tmp <= (uint64_t)(MAX_I64 - res.value));
 
 	res.value += tmp;
 
@@ -177,7 +177,7 @@ struct bw_fixed bw_mul(const struct bw_fixed arg1, const struct bw_fixed arg2)
 	tmp = (tmp >> BW_FIXED_BITS_PER_FRACTIONAL_PART) +
 		(tmp >= (uint64_t)(bw_frc_to_fixed(1, 2).value));
 
-	ASSERT(tmp <= (uint64_t)(MAX_I64 - res.value));
+	ASSERT_WARN(tmp <= (uint64_t)(MAX_I64 - res.value));
 
 	res.value += tmp;
 
diff --git a/drivers/gpu/drm/amd/display/dc/basics/dce_calcs.c b/drivers/gpu/drm/amd/display/dc/basics/dce_calcs.c
index 681799468487..2e1acf5cde08 100644
--- a/drivers/gpu/drm/amd/display/dc/basics/dce_calcs.c
+++ b/drivers/gpu/drm/amd/display/dc/basics/dce_calcs.c
@@ -2803,7 +2803,7 @@ static void populate_initial_data(
 		if (!pipe[i].stream || !pipe[i].bottom_pipe)
 			continue;
 
-		ASSERT(pipe[i].plane_state);
+		ASSERT_WARN(pipe[i].plane_state);
 
 		if (num_displays == 0) {
 			if (!pipe[i].plane_state->visible)
diff --git a/drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c b/drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c
index 88d3f9d7dd55..1e32a9ca7f49 100644
--- a/drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c
+++ b/drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c
@@ -51,7 +51,7 @@ static inline unsigned long long complete_integer_division_u64(
 {
 	unsigned long long result;
 
-	ASSERT(divisor);
+	ASSERT_WARN(divisor);
 
 	result = div64_u64_rem(dividend, divisor, remainder);
 
@@ -85,7 +85,7 @@ struct fixed31_32 dc_fixpt_from_fraction(long long numerator, long long denomina
 	unsigned long long res_value = complete_integer_division_u64(
 		arg1_value, arg2_value, &remainder);
 
-	ASSERT(res_value <= LONG_MAX);
+	ASSERT_WARN(res_value <= LONG_MAX);
 
 	/* determine fractional part */
 	{
@@ -107,7 +107,7 @@ struct fixed31_32 dc_fixpt_from_fraction(long long numerator, long long denomina
 	{
 		unsigned long long summand = (remainder << 1) >= arg2_value;
 
-		ASSERT(res_value <= LLONG_MAX - summand);
+		ASSERT_WARN(res_value <= LLONG_MAX - summand);
 
 		res_value += summand;
 	}
@@ -144,13 +144,13 @@ struct fixed31_32 dc_fixpt_mul(struct fixed31_32 arg1, struct fixed31_32 arg2)
 
 	tmp = arg1_int * arg2_fra;
 
-	ASSERT(tmp <= (unsigned long long)(LLONG_MAX - res.value));
+	ASSERT_WARN(tmp <= (unsigned long long)(LLONG_MAX - res.value));
 
 	res.value += tmp;
 
 	tmp = arg2_int * arg1_fra;
 
-	ASSERT(tmp <= (unsigned long long)(LLONG_MAX - res.value));
+	ASSERT_WARN(tmp <= (unsigned long long)(LLONG_MAX - res.value));
 
 	res.value += tmp;
 
@@ -159,7 +159,7 @@ struct fixed31_32 dc_fixpt_mul(struct fixed31_32 arg1, struct fixed31_32 arg2)
 	tmp = (tmp >> FIXED31_32_BITS_PER_FRACTIONAL_PART) +
 		(tmp >= (unsigned long long)dc_fixpt_half.value);
 
-	ASSERT(tmp <= (unsigned long long)(LLONG_MAX - res.value));
+	ASSERT_WARN(tmp <= (unsigned long long)(LLONG_MAX - res.value));
 
 	res.value += tmp;
 
@@ -187,11 +187,11 @@ struct fixed31_32 dc_fixpt_sqr(struct fixed31_32 arg)
 
 	tmp = arg_int * arg_fra;
 
-	ASSERT(tmp <= (unsigned long long)(LLONG_MAX - res.value));
+	ASSERT_WARN(tmp <= (unsigned long long)(LLONG_MAX - res.value));
 
 	res.value += tmp;
 
-	ASSERT(tmp <= (unsigned long long)(LLONG_MAX - res.value));
+	ASSERT_WARN(tmp <= (unsigned long long)(LLONG_MAX - res.value));
 
 	res.value += tmp;
 
@@ -200,7 +200,7 @@ struct fixed31_32 dc_fixpt_sqr(struct fixed31_32 arg)
 	tmp = (tmp >> FIXED31_32_BITS_PER_FRACTIONAL_PART) +
 		(tmp >= (unsigned long long)dc_fixpt_half.value);
 
-	ASSERT(tmp <= (unsigned long long)(LLONG_MAX - res.value));
+	ASSERT_WARN(tmp <= (unsigned long long)(LLONG_MAX - res.value));
 
 	res.value += tmp;
 
@@ -214,7 +214,7 @@ struct fixed31_32 dc_fixpt_recip(struct fixed31_32 arg)
 	 * Good idea to use Newton's method
 	 */
 
-	ASSERT(arg.value);
+	ASSERT_WARN(arg.value);
 
 	return dc_fixpt_from_fraction(
 		dc_fixpt_one.value,
@@ -313,7 +313,7 @@ static struct fixed31_32 fixed31_32_exp_from_taylor_series(struct fixed31_32 arg
 		n + 1);
 	/* TODO find correct res */
 
-	ASSERT(dc_fixpt_lt(arg, dc_fixpt_one));
+	ASSERT_WARN(dc_fixpt_lt(arg, dc_fixpt_one));
 
 	do
 		res = dc_fixpt_add(
@@ -355,9 +355,9 @@ struct fixed31_32 dc_fixpt_exp(struct fixed31_32 arg)
 				dc_fixpt_ln2,
 				m));
 
-		ASSERT(m != 0);
+		ASSERT_WARN(m != 0);
 
-		ASSERT(dc_fixpt_lt(
+		ASSERT_WARN(dc_fixpt_lt(
 			dc_fixpt_abs(r),
 			dc_fixpt_one));
 
@@ -382,7 +382,7 @@ struct fixed31_32 dc_fixpt_log(struct fixed31_32 arg)
 
 	struct fixed31_32 error;
 
-	ASSERT(arg.value > 0);
+	ASSERT_WARN(arg.value > 0);
 	/* TODO if arg is negative, return NaN */
 	/* TODO if arg is zero, return -INF */
 
diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
index c9a6de110b74..06705c6e9a64 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
@@ -1097,7 +1097,7 @@ static enum bp_result bios_parser_get_spread_spectrum_info(
 			return get_ss_info_v4_5(bp, signal, index, ss_info);
 
 		default:
-			ASSERT(0);
+			ASSERT_WARN(0);
 			break;
 		}
 		break;
@@ -1991,7 +1991,7 @@ static enum bp_result get_firmware_info_v3_4(
 		break;
 
 	default:
-		ASSERT(0);
+		ASSERT_WARN(0);
 		break;
 	}
 
@@ -3761,7 +3761,7 @@ static bool bios_parser2_construct(
 
 		bp->object_info_tbl.v1_5 = tbl_v1_5;
 	} else {
-		ASSERT(0);
+		ASSERT_WARN(0);
 		return false;
 	}
 
diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser_common.c b/drivers/gpu/drm/amd/display/dc/bios/bios_parser_common.c
index 34e3a64f556e..4215ec807856 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser_common.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser_common.c
@@ -162,7 +162,7 @@ static enum encoder_id encoder_id_from_bios_object_id(uint32_t bios_object_id)
 		break;
 	default:
 		id = ENCODER_ID_UNKNOWN;
-		ASSERT(0);
+		ASSERT_WARN(0);
 		break;
 	}
 
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
index 0e243f4344d0..c78975feab6c 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
@@ -374,7 +374,7 @@ struct clk_mgr *dc_clk_mgr_create(struct dc_context *ctx, struct pp_smu_funcs *p
 	break;
 #endif	/* CONFIG_DRM_AMD_DC_FP */
 	default:
-		ASSERT(0); /* Unknown Asic */
+		ASSERT_WARN(0); /* Unknown Asic */
 		break;
 	}
 
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c
index 26feefbb8990..22c3081611aa 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c
@@ -134,9 +134,9 @@ int dce_get_dp_ref_freq_khz(struct clk_mgr *clk_mgr_base)
 	int dp_ref_clk_khz;
 	int target_div;
 
-	/* ASSERT DP Reference Clock source is from DFS*/
+	/* ASSERT_WARN DP Reference Clock source is from DFS*/
 	REG_GET(DPREFCLK_CNTL, DPREFCLK_SRC_SEL, &dprefclk_src_sel);
-	ASSERT(dprefclk_src_sel == 0);
+	ASSERT_WARN(dprefclk_src_sel == 0);
 
 	/* Read the mmDENTIST_DISPCLK_CNTL to get the currently
 	 * programmed DID DENTIST_DPREFCLK_WDIVIDER*/
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dce110/dce110_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dce110/dce110_clk_mgr.c
index f8409453434c..e12c2a13538b 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dce110/dce110_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dce110/dce110_clk_mgr.c
@@ -85,7 +85,7 @@ static int determine_sclk_from_bounding_box(
 	 * is unexpected at this stage, should have been caught at
 	 * validation time
 	 */
-	ASSERT(0);
+	ASSERT_WARN(0);
 	return dc->sclk_lvls.clocks_in_khz[dc->sclk_lvls.num_levels - 1];
 }
 
@@ -137,7 +137,7 @@ void dce110_fill_display_configs(
 				break;
 			}
 
-		ASSERT(pipe_ctx != NULL);
+		ASSERT_WARN(pipe_ctx != NULL);
 
 		/* only notify active stream */
 		if (stream->dpms_off)
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr.c
index 369421e46c52..b7c22f46682e 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr.c
@@ -199,7 +199,7 @@ static void rv1_update_clocks(struct clk_mgr *clk_mgr_base,
 
 	bool enter_display_off = false;
 
-	ASSERT(clk_mgr->pp_smu);
+	ASSERT_WARN(clk_mgr->pp_smu);
 
 	if (dc->work_arounds.skip_clock_update)
 		return;
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.c
index 19897fa52e7e..2852931913e8 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.c
@@ -116,7 +116,7 @@ static int rv1_vbios_smu_send_msg_with_param(struct clk_mgr_internal *clk_mgr,
 
 	result = rv1_smu_wait_for_response(clk_mgr, 10, 1000);
 
-	ASSERT(result == VBIOSSMC_Result_OK);
+	ASSERT_WARN(result == VBIOSSMC_Result_OK);
 
 	/* Actual dispclk set is returned in the parameter register */
 	return REG_READ(MP1_SMN_C2PMSG_83);
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c
index e18097f82091..f70d347bc227 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c
@@ -490,7 +490,7 @@ static void build_watermark_ranges(struct clk_bw_params *bw_params, struct pp_sm
 		num_valid_sets++;
 	}
 
-	ASSERT(num_valid_sets != 0); /* Must have at least one set of valid watermarks */
+	ASSERT_WARN(num_valid_sets != 0); /* Must have at least one set of valid watermarks */
 	ranges->num_reader_wm_sets = num_valid_sets;
 
 	/* modify the min and max to make sure we cover the whole range*/
@@ -620,7 +620,7 @@ static unsigned int find_socclk_for_voltage(struct dpm_clocks *clock_table, unsi
 			return clock_table->SocClocks[i].Freq;
 	}
 
-	ASSERT(0);
+	ASSERT_WARN(0);
 	return 0;
 }
 
@@ -633,7 +633,7 @@ static unsigned int find_dcfclk_for_voltage(struct dpm_clocks *clock_table, unsi
 			return clock_table->DcfClocks[i].Freq;
 	}
 
-	ASSERT(0);
+	ASSERT_WARN(0);
 	return 0;
 }
 
@@ -657,7 +657,7 @@ static void rn_clk_mgr_helper_populate_bw_params(struct clk_bw_params *bw_params
 
 	if (j == -1) {
 		/* clock table is all 0s, just use our own hardcode */
-		ASSERT(0);
+		ASSERT_WARN(0);
 		return;
 	}
 
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.c
index 23b390245b5d..764d6c089646 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.c
@@ -123,7 +123,7 @@ static int rn_vbios_smu_send_msg_with_param(struct clk_mgr_internal *clk_mgr,
 	result = rn_smu_wait_for_response(clk_mgr, 10, 200000);
 
 	if (IS_SMU_TIMEOUT(result)) {
-		ASSERT(0);
+		ASSERT_WARN(0);
 		dm_helpers_smu_timeout(CTX, msg_id, param, 10 * 200000);
 	}
 
@@ -159,7 +159,7 @@ int rn_vbios_smu_set_dispclk(struct clk_mgr_internal *clk_mgr, int requested_dis
 	}
 
 	// pmfw always set clock more than or equal requested clock
-	ASSERT(actual_dispclk_set_mhz >= khz_to_mhz_ceil(requested_dispclk_khz));
+	ASSERT_WARN(actual_dispclk_set_mhz >= khz_to_mhz_ceil(requested_dispclk_khz));
 
 	return actual_dispclk_set_mhz * 1000;
 }
@@ -225,7 +225,7 @@ int rn_vbios_smu_set_dppclk(struct clk_mgr_internal *clk_mgr, int requested_dpp_
 			VBIOSSMC_MSG_SetDppclkFreq,
 			khz_to_mhz_ceil(requested_dpp_khz));
 
-	ASSERT(actual_dppclk_set_mhz >= khz_to_mhz_ceil(requested_dpp_khz));
+	ASSERT_WARN(actual_dppclk_set_mhz >= khz_to_mhz_ceil(requested_dpp_khz));
 
 	return actual_dppclk_set_mhz * 1000;
 }
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c
index 8083a553c60e..ca4db5786556 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c
@@ -549,7 +549,7 @@ void dcn3_clk_mgr_construct(
 	/* Value already divided by 10, some resolution lost */
 
 	/*TODO: uncomment assert once dcn3_dump_clk_registers is implemented */
-	//ASSERT(s.dprefclk != 0);
+	//ASSERT_WARN(s.dprefclk != 0);
 	if (s.dprefclk != 0)
 		clk_mgr->base.dprefclk_khz = s.dprefclk * 1000;
 
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/dcn301_smu.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/dcn301_smu.c
index b4fb17b7a096..9ca65778ee99 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/dcn301_smu.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/dcn301_smu.c
@@ -122,7 +122,7 @@ static int dcn301_smu_send_msg_with_param(struct clk_mgr_internal *clk_mgr,
 	result = dcn301_smu_wait_for_response(clk_mgr, 10, 200000);
 
 	if (IS_SMU_TIMEOUT(result)) {
-		ASSERT(0);
+		ASSERT_WARN(0);
 		dm_helpers_smu_timeout(CTX, msg_id, param, 10 * 200000);
 	}
 
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c
index 9e2ef0e724fc..3c0f1c59c2b1 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c
@@ -422,7 +422,7 @@ static void vg_build_watermark_ranges(struct clk_bw_params *bw_params, struct wa
 		num_valid_sets++;
 	}
 
-	ASSERT(num_valid_sets != 0); /* Must have at least one set of valid watermarks */
+	ASSERT_WARN(num_valid_sets != 0); /* Must have at least one set of valid watermarks */
 
 	/* modify the min and max to make sure we cover the whole range*/
 	table->WatermarkRow[WM_DCFCLK][0].MinMclk = 0;
@@ -552,7 +552,7 @@ static unsigned int find_dcfclk_for_voltage(const struct vg_dpm_clocks *clock_ta
 			return clock_table->DcfClocks[i];
 	}
 
-	ASSERT(0);
+	ASSERT_WARN(0);
 	return 0;
 }
 
@@ -580,7 +580,7 @@ static void vg_clk_mgr_helper_populate_bw_params(
 
 	if (j == -1) {
 		/* clock table is all 0s, just use our own hardcode */
-		ASSERT(0);
+		ASSERT_WARN(0);
 		return;
 	}
 
@@ -690,7 +690,7 @@ void vg_clk_mgr_construct(
 		clk_mgr->smu_wm_set.wm_set = &dummy_wms;
 		clk_mgr->smu_wm_set.mc_address.quad_part = 0;
 	}
-	ASSERT(clk_mgr->smu_wm_set.wm_set);
+	ASSERT_WARN(clk_mgr->smu_wm_set.wm_set);
 
 	smu_dpm_clks.dpm_clks = (struct vg_dpm_clocks *)dm_helpers_allocate_gpu_mem(
 				clk_mgr->base.base.ctx,
@@ -703,7 +703,7 @@ void vg_clk_mgr_construct(
 		smu_dpm_clks.mc_address.quad_part = 0;
 	}
 
-	ASSERT(smu_dpm_clks.dpm_clks);
+	ASSERT_WARN(smu_dpm_clks.dpm_clks);
 
 	clk_mgr->base.smu_ver = dcn301_smu_get_smu_version(&clk_mgr->base);
 
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c
index bc123f1884da..0488d3828240 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c
@@ -458,7 +458,7 @@ static void dcn31_build_watermark_ranges(struct clk_bw_params *bw_params, struct
 		num_valid_sets++;
 	}
 
-	ASSERT(num_valid_sets != 0); /* Must have at least one set of valid watermarks */
+	ASSERT_WARN(num_valid_sets != 0); /* Must have at least one set of valid watermarks */
 
 	/* modify the min and max to make sure we cover the whole range*/
 	table->WatermarkRow[WM_DCFCLK][0].MinMclk = 0;
@@ -549,7 +549,7 @@ static unsigned int find_clk_for_voltage(
 		}
 	}
 
-	ASSERT(clock);
+	ASSERT_WARN(clock);
 	return clock;
 }
 
@@ -577,7 +577,7 @@ static void dcn31_clk_mgr_helper_populate_bw_params(struct clk_mgr_internal *clk
 
 	if (j == -1) {
 		/* clock table is all 0s, just use our own hardcode */
-		ASSERT(0);
+		ASSERT_WARN(0);
 		return;
 	}
 
@@ -589,7 +589,7 @@ static void dcn31_clk_mgr_helper_populate_bw_params(struct clk_mgr_internal *clk
 		max_dispclk = find_max_clk_value(clock_table->DispClocks, clock_table->NumDispClkLevelsEnabled);
 		max_dppclk = find_max_clk_value(clock_table->DppClocks, clock_table->NumDispClkLevelsEnabled);
 	} else {
-		ASSERT(0);
+		ASSERT_WARN(0);
 	}
 
 	for (i = 0; i < bw_params->clk_table.num_entries; i++, j--) {
@@ -702,7 +702,7 @@ void dcn31_clk_mgr_construct(
 		clk_mgr->smu_wm_set.wm_set = &dummy_wms;
 		clk_mgr->smu_wm_set.mc_address.quad_part = 0;
 	}
-	ASSERT(clk_mgr->smu_wm_set.wm_set);
+	ASSERT_WARN(clk_mgr->smu_wm_set.wm_set);
 
 	smu_dpm_clks.dpm_clks = (DpmClocks_t *)dm_helpers_allocate_gpu_mem(
 				clk_mgr->base.base.ctx,
@@ -715,7 +715,7 @@ void dcn31_clk_mgr_construct(
 		smu_dpm_clks.mc_address.quad_part = 0;
 	}
 
-	ASSERT(smu_dpm_clks.dpm_clks);
+	ASSERT_WARN(smu_dpm_clks.dpm_clks);
 
 	clk_mgr->base.smu_ver = dcn31_smu_get_smu_version(&clk_mgr->base);
 
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn31/dcn31_smu.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn31/dcn31_smu.c
index f201628e4e98..637ec71fd747 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn31/dcn31_smu.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn31/dcn31_smu.c
@@ -131,13 +131,13 @@ static int dcn31_smu_send_msg_with_param(struct clk_mgr_internal *clk_mgr,
 		    param == TABLE_WATERMARKS)
 			DC_LOG_DEBUG("Watermarks table not configured properly by SMU");
 		else
-			ASSERT(0);
+			ASSERT_WARN(0);
 		REG_WRITE(MP1_SMN_C2PMSG_91, VBIOSSMC_Result_OK);
 		return -1;
 	}
 
 	if (IS_SMU_TIMEOUT(result)) {
-		ASSERT(0);
+		ASSERT_WARN(0);
 		dm_helpers_smu_timeout(CTX, msg_id, param, 10 * 200000);
 	}
 
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c
index 91d872d6d392..df38d474b090 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c
@@ -522,7 +522,7 @@ static void dcn314_build_watermark_ranges(struct clk_bw_params *bw_params, struc
 		num_valid_sets++;
 	}
 
-	ASSERT(num_valid_sets != 0); /* Must have at least one set of valid watermarks */
+	ASSERT_WARN(num_valid_sets != 0); /* Must have at least one set of valid watermarks */
 
 	/* modify the min and max to make sure we cover the whole range*/
 	table->WatermarkRow[WM_DCFCLK][0].MinMclk = 0;
@@ -633,7 +633,7 @@ static void dcn314_clk_mgr_helper_populate_bw_params(struct clk_mgr_internal *cl
 	}
 
 	/* We expect the table to contain at least one valid fclk entry. */
-	ASSERT(is_valid_clock_value(max_fclk));
+	ASSERT_WARN(is_valid_clock_value(max_fclk));
 
 	/* Dispclk and dppclk can be max at any voltage, same number of levels for both */
 	if (clock_table->NumDispClkLevelsEnabled <= NUM_DISPCLK_DPM_LEVELS &&
@@ -642,7 +642,7 @@ static void dcn314_clk_mgr_helper_populate_bw_params(struct clk_mgr_internal *cl
 		max_dppclk = find_max_clk_value(clock_table->DppClocks, clock_table->NumDispClkLevelsEnabled);
 	} else {
 		/* Invalid number of entries in the table from PMFW. */
-		ASSERT(0);
+		ASSERT_WARN(0);
 	}
 
 	/* Base the clock table on dcfclk, need at least one entry regardless of pmfw table */
@@ -702,7 +702,7 @@ static void dcn314_clk_mgr_helper_populate_bw_params(struct clk_mgr_internal *cl
 	bw_params->clk_table.entries[i].socclk_mhz = find_max_clk_value(clock_table->SocClocks, NUM_SOCCLK_DPM_LEVELS);
 	bw_params->clk_table.entries[i].dispclk_mhz = find_max_clk_value(clock_table->DispClocks, NUM_DISPCLK_DPM_LEVELS);
 	bw_params->clk_table.entries[i].dppclk_mhz = find_max_clk_value(clock_table->DppClocks, NUM_DPPCLK_DPM_LEVELS);
-	ASSERT(clock_table->DcfClocks[i] == find_max_clk_value(clock_table->DcfClocks, NUM_DCFCLK_DPM_LEVELS));
+	ASSERT_WARN(clock_table->DcfClocks[i] == find_max_clk_value(clock_table->DcfClocks, NUM_DCFCLK_DPM_LEVELS));
 	bw_params->clk_table.entries[i].phyclk_mhz = def_max.phyclk_mhz;
 	bw_params->clk_table.entries[i].phyclk_d18_mhz = def_max.phyclk_d18_mhz;
 	bw_params->clk_table.entries[i].dtbclk_mhz = def_max.dtbclk_mhz;
@@ -732,7 +732,7 @@ static void dcn314_clk_mgr_helper_populate_bw_params(struct clk_mgr_internal *cl
 		if (!bw_params->clk_table.entries[i].dtbclk_mhz)
 			bw_params->clk_table.entries[i].dtbclk_mhz = def_max.dtbclk_mhz;
 	}
-	ASSERT(bw_params->clk_table.entries[i-1].dcfclk_mhz);
+	ASSERT_WARN(bw_params->clk_table.entries[i-1].dcfclk_mhz);
 	bw_params->vram_type = bios_info->memory_type;
 
 	bw_params->dram_channel_width_bytes = bios_info->memory_type == 0x22 ? 8 : 4;
@@ -812,7 +812,7 @@ void dcn314_clk_mgr_construct(
 		clk_mgr->smu_wm_set.wm_set = &dummy_wms;
 		clk_mgr->smu_wm_set.mc_address.quad_part = 0;
 	}
-	ASSERT(clk_mgr->smu_wm_set.wm_set);
+	ASSERT_WARN(clk_mgr->smu_wm_set.wm_set);
 
 	smu_dpm_clks.dpm_clks = (DpmClocks314_t *)dm_helpers_allocate_gpu_mem(
 				clk_mgr->base.base.ctx,
@@ -825,7 +825,7 @@ void dcn314_clk_mgr_construct(
 		smu_dpm_clks.mc_address.quad_part = 0;
 	}
 
-	ASSERT(smu_dpm_clks.dpm_clks);
+	ASSERT_WARN(smu_dpm_clks.dpm_clks);
 
 	clk_mgr->base.smu_ver = dcn314_smu_get_smu_version(&clk_mgr->base);
 
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn314/dcn314_smu.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn314/dcn314_smu.c
index c4af406146b7..48d2e911f7b0 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn314/dcn314_smu.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn314/dcn314_smu.c
@@ -150,13 +150,13 @@ static int dcn314_smu_send_msg_with_param(struct clk_mgr_internal *clk_mgr,
 			 msg_id == VBIOSSMC_MSG_SetMinDeepSleepDcfclk)
 			DC_LOG_WARNING("DCFCLK_DPM is not enabled by BIOS");
 		else
-			ASSERT(0);
+			ASSERT_WARN(0);
 		REG_WRITE(MP1_SMN_C2PMSG_91, VBIOSSMC_Result_OK);
 		return -1;
 	}
 
 	if (IS_SMU_TIMEOUT(result)) {
-		ASSERT(0);
+		ASSERT_WARN(0);
 		dm_helpers_smu_timeout(CTX, msg_id, param, 10 * 200000);
 	}
 
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c
index a0fb4481d2f1..82525dc11e5a 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c
@@ -417,7 +417,7 @@ static void dcn315_build_watermark_ranges(struct clk_bw_params *bw_params, struc
 		num_valid_sets++;
 	}
 
-	ASSERT(num_valid_sets != 0); /* Must have at least one set of valid watermarks */
+	ASSERT_WARN(num_valid_sets != 0); /* Must have at least one set of valid watermarks */
 
 	/* modify the min and max to make sure we cover the whole range*/
 	table->WatermarkRow[WM_DCFCLK][0].MinMclk = 0;
@@ -560,10 +560,10 @@ static void dcn315_clk_mgr_helper_populate_bw_params(
 	}
 
 	/* Make sure all highest default clocks are included*/
-	ASSERT(bw_params->clk_table.entries[i-1].phyclk_mhz == def_max.phyclk_mhz);
-	ASSERT(bw_params->clk_table.entries[i-1].phyclk_d18_mhz == def_max.phyclk_d18_mhz);
-	ASSERT(bw_params->clk_table.entries[i-1].dtbclk_mhz == def_max.dtbclk_mhz);
-	ASSERT(bw_params->clk_table.entries[i-1].dcfclk_mhz);
+	ASSERT_WARN(bw_params->clk_table.entries[i-1].phyclk_mhz == def_max.phyclk_mhz);
+	ASSERT_WARN(bw_params->clk_table.entries[i-1].phyclk_d18_mhz == def_max.phyclk_d18_mhz);
+	ASSERT_WARN(bw_params->clk_table.entries[i-1].dtbclk_mhz == def_max.dtbclk_mhz);
+	ASSERT_WARN(bw_params->clk_table.entries[i-1].dcfclk_mhz);
 	bw_params->vram_type = bios_info->memory_type;
 	bw_params->num_channels = bios_info->ma_channel_number;
 	bw_params->dram_channel_width_bytes = bios_info->memory_type == 0x22 ? 8 : 4;
@@ -631,7 +631,7 @@ void dcn315_clk_mgr_construct(
 		clk_mgr->smu_wm_set.wm_set = &dummy_wms;
 		clk_mgr->smu_wm_set.mc_address.quad_part = 0;
 	}
-	ASSERT(clk_mgr->smu_wm_set.wm_set);
+	ASSERT_WARN(clk_mgr->smu_wm_set.wm_set);
 
 	smu_dpm_clks.dpm_clks = (DpmClocks_315_t *)dm_helpers_allocate_gpu_mem(
 				clk_mgr->base.base.ctx,
@@ -644,7 +644,7 @@ void dcn315_clk_mgr_construct(
 		smu_dpm_clks.mc_address.quad_part = 0;
 	}
 
-	ASSERT(smu_dpm_clks.dpm_clks);
+	ASSERT_WARN(smu_dpm_clks.dpm_clks);
 
 	clk_mgr->base.smu_ver = dcn315_smu_get_smu_version(&clk_mgr->base);
 
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_smu.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_smu.c
index 2d14346b680e..7e780b0887d3 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_smu.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_smu.c
@@ -168,7 +168,7 @@ static int dcn315_smu_send_msg_with_param(
 	result = dcn315_smu_wait_for_response(clk_mgr, 10, 200000);
 
 	if (result == VBIOSSMC_Status_BUSY) {
-		ASSERT(0);
+		ASSERT_WARN(0);
 		dm_helpers_smu_timeout(CTX, msg_id, param, 10 * 200000);
 	}
 
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c
index c3e50c3aaa60..4dbdc0e4c694 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c
@@ -379,7 +379,7 @@ static void dcn316_build_watermark_ranges(struct clk_bw_params *bw_params, struc
 		num_valid_sets++;
 	}
 
-	ASSERT(num_valid_sets != 0); /* Must have at least one set of valid watermarks */
+	ASSERT_WARN(num_valid_sets != 0); /* Must have at least one set of valid watermarks */
 
 	/* modify the min and max to make sure we cover the whole range*/
 	table->WatermarkRow[WM_DCFCLK][0].MinMclk = 0;
@@ -470,7 +470,7 @@ static unsigned int find_clk_for_voltage(
 		}
 	}
 
-	ASSERT(clock);
+	ASSERT_WARN(clock);
 	return clock;
 }
 
@@ -499,7 +499,7 @@ static void dcn316_clk_mgr_helper_populate_bw_params(
 
 	if (j == -1) {
 		/* clock table is all 0s, just use our own hardcode */
-		ASSERT(0);
+		ASSERT_WARN(0);
 		return;
 	}
 
@@ -511,7 +511,7 @@ static void dcn316_clk_mgr_helper_populate_bw_params(
 		max_dispclk = find_max_clk_value(clock_table->DispClocks, clock_table->NumDispClkLevelsEnabled);
 		max_dppclk = find_max_clk_value(clock_table->DppClocks, clock_table->NumDispClkLevelsEnabled);
 	} else {
-		ASSERT(0);
+		ASSERT_WARN(0);
 	}
 
 	for (i = 0; i < bw_params->clk_table.num_entries; i++, j--) {
@@ -602,7 +602,7 @@ void dcn316_clk_mgr_construct(
 		clk_mgr->smu_wm_set.wm_set = &dummy_wms;
 		clk_mgr->smu_wm_set.mc_address.quad_part = 0;
 	}
-	ASSERT(clk_mgr->smu_wm_set.wm_set);
+	ASSERT_WARN(clk_mgr->smu_wm_set.wm_set);
 
 	smu_dpm_clks.dpm_clks = (DpmClocks_316_t *)dm_helpers_allocate_gpu_mem(
 				clk_mgr->base.base.ctx,
@@ -615,7 +615,7 @@ void dcn316_clk_mgr_construct(
 		smu_dpm_clks.mc_address.quad_part = 0;
 	}
 
-	ASSERT(smu_dpm_clks.dpm_clks);
+	ASSERT_WARN(smu_dpm_clks.dpm_clks);
 
 	clk_mgr->base.smu_ver = dcn316_smu_get_smu_version(&clk_mgr->base);
 
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_smu.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_smu.c
index 8b82092b91cd..1fc2882328e8 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_smu.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_smu.c
@@ -142,7 +142,7 @@ static int dcn316_smu_send_msg_with_param(
 	result = dcn316_smu_wait_for_response(clk_mgr, 10, 200000);
 
 	if (result == VBIOSSMC_Status_BUSY) {
-		ASSERT(0);
+		ASSERT_WARN(0);
 		dm_helpers_smu_timeout(CTX, msg_id, param, 10 * 200000);
 	}
 
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c
index 084994c650c4..940e0c0b6aa8 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c
@@ -333,7 +333,7 @@ void dcn32_update_clocks_update_dpp_dto(struct clk_mgr_internal *clk_mgr,
 			/* The software state is not valid if dpp resource is NULL and
 			 * dppclk_khz > 0.
 			 */
-			ASSERT(false);
+			ASSERT_WARN(false);
 			continue;
 		}
 
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c
index b77333817f18..53c83f55e80d 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c
@@ -229,7 +229,7 @@ static void dcn35_update_clocks_update_dpp_dto(struct clk_mgr_internal *clk_mgr,
 			/* The software state is not valid if dpp resource is NULL and
 			 * dppclk_khz > 0.
 			 */
-			ASSERT(false);
+			ASSERT_WARN(false);
 			continue;
 		}
 
@@ -696,7 +696,7 @@ static void dcn35_build_watermark_ranges(struct clk_bw_params *bw_params, struct
 		num_valid_sets++;
 	}
 
-	ASSERT(num_valid_sets != 0); /* Must have at least one set of valid watermarks */
+	ASSERT_WARN(num_valid_sets != 0); /* Must have at least one set of valid watermarks */
 
 	/* modify the min and max to make sure we cover the whole range*/
 	table->WatermarkRow[WM_DCFCLK][0].MinMclk = 0;
@@ -831,7 +831,7 @@ static void dcn35_clk_mgr_helper_populate_bw_params(struct clk_mgr_internal *clk
 	}
 
 	/* We expect the table to contain at least one valid P-state entry. */
-	ASSERT(clock_table->NumMemPstatesEnabled &&
+	ASSERT_WARN(clock_table->NumMemPstatesEnabled &&
 	       is_valid_clock_value(max_dram_speed_mts) &&
 	       is_valid_clock_value(min_dram_speed_mts));
 
@@ -844,11 +844,11 @@ static void dcn35_clk_mgr_helper_populate_bw_params(struct clk_mgr_internal *clk
 			clock_table->NumDispClkLevelsEnabled);
 	} else {
 		/* Invalid number of entries in the table from PMFW. */
-		ASSERT(0);
+		ASSERT_WARN(0);
 	}
 
 	/* Base the clock table on dcfclk, need at least one entry regardless of pmfw table */
-	ASSERT(clock_table->NumDcfClkLevelsEnabled > 0);
+	ASSERT_WARN(clock_table->NumDcfClkLevelsEnabled > 0);
 
 	num_fclk = (clock_table->NumFclkLevelsEnabled > NUM_FCLK_DPM_LEVELS) ? NUM_FCLK_DPM_LEVELS :
 		clock_table->NumFclkLevelsEnabled;
@@ -911,7 +911,7 @@ static void dcn35_clk_mgr_helper_populate_bw_params(struct clk_mgr_internal *clk
 		find_max_clk_value(clock_table->DppClocks, NUM_DPPCLK_DPM_LEVELS);
 	bw_params->clk_table.entries[i].fclk_mhz =
 		find_max_clk_value(clock_table->FclkClocks_Freq, NUM_FCLK_DPM_LEVELS);
-	ASSERT(clock_table->DcfClocks[i] == find_max_clk_value(clock_table->DcfClocks, NUM_DCFCLK_DPM_LEVELS));
+	ASSERT_WARN(clock_table->DcfClocks[i] == find_max_clk_value(clock_table->DcfClocks, NUM_DCFCLK_DPM_LEVELS));
 	bw_params->clk_table.entries[i].phyclk_mhz = def_max.phyclk_mhz;
 	bw_params->clk_table.entries[i].phyclk_d18_mhz = def_max.phyclk_d18_mhz;
 	bw_params->clk_table.entries[i].dtbclk_mhz = def_max.dtbclk_mhz;
@@ -949,7 +949,7 @@ static void dcn35_clk_mgr_helper_populate_bw_params(struct clk_mgr_internal *clk
 		if (!bw_params->clk_table.entries[i].dtbclk_mhz)
 			bw_params->clk_table.entries[i].dtbclk_mhz = def_max.dtbclk_mhz;
 	}
-	ASSERT(bw_params->clk_table.entries[i-1].dcfclk_mhz);
+	ASSERT_WARN(bw_params->clk_table.entries[i-1].dcfclk_mhz);
 	bw_params->vram_type = bios_info->memory_type;
 	bw_params->dram_channel_width_bytes = bios_info->memory_type == 0x22 ? 8 : 4;
 	bw_params->num_channels = bios_info->ma_channel_number ? bios_info->ma_channel_number : 4;
@@ -1123,7 +1123,7 @@ void dcn35_clk_mgr_construct(
 		clk_mgr->smu_wm_set.wm_set = &dummy_wms;
 		clk_mgr->smu_wm_set.mc_address.quad_part = 0;
 	}
-	ASSERT(clk_mgr->smu_wm_set.wm_set);
+	ASSERT_WARN(clk_mgr->smu_wm_set.wm_set);
 
 	smu_dpm_clks.dpm_clks = (DpmClocks_t_dcn35 *)dm_helpers_allocate_gpu_mem(
 				clk_mgr->base.base.ctx,
@@ -1136,7 +1136,7 @@ void dcn35_clk_mgr_construct(
 		smu_dpm_clks.mc_address.quad_part = 0;
 	}
 
-	ASSERT(smu_dpm_clks.dpm_clks);
+	ASSERT_WARN(smu_dpm_clks.dpm_clks);
 
 	clk_mgr->base.smu_ver = dcn35_smu_get_smu_version(&clk_mgr->base);
 
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.c
index f6f0e6a33001..910afad8e4ec 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.c
@@ -140,7 +140,7 @@ static int dcn35_smu_send_msg_with_param(struct clk_mgr_internal *clk_mgr,
 	uint32_t result;
 
 	result = dcn35_smu_wait_for_response(clk_mgr, 10, 2000000);
-	ASSERT(result == VBIOSSMC_Result_OK);
+	ASSERT_WARN(result == VBIOSSMC_Result_OK);
 
 	if (result != VBIOSSMC_Result_OK) {
 		DC_LOG_WARNING("SMU response after wait: %d, msg id = %d\n", result, msg_id);
@@ -165,14 +165,14 @@ static int dcn35_smu_send_msg_with_param(struct clk_mgr_internal *clk_mgr,
 		    param == TABLE_WATERMARKS)
 			DC_LOG_WARNING("Watermarks table not configured properly by SMU");
 		else
-			ASSERT(0);
+			ASSERT_WARN(0);
 		REG_WRITE(MP1_SMN_C2PMSG_91, VBIOSSMC_Result_OK);
 		DC_LOG_WARNING("SMU response after wait: %d, msg id = %d\n", result, msg_id);
 		return -1;
 	}
 
 	if (IS_SMU_TIMEOUT(result)) {
-		ASSERT(0);
+		ASSERT_WARN(0);
 		result = dcn35_smu_wait_for_response(clk_mgr, 10, 2000000);
 		//dm_helpers_smu_timeout(CTX, msg_id, param, 10 * 200000);
 		DC_LOG_WARNING("SMU response after wait: %d, msg id = %d\n", result, msg_id);
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c
index 8cfc5f435937..8df3faba2790 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c
@@ -508,10 +508,10 @@ static void dcn401_update_clocks_update_dtb_dto(struct clk_mgr_internal *clk_mgr
 	for (i = 0; i < context->stream_count; i++) {
 		otg_master = resource_get_otg_master_for_stream(
 				&context->res_ctx, context->streams[i]);
-		ASSERT(otg_master);
-		ASSERT(otg_master->clock_source);
-		ASSERT(otg_master->clock_source->funcs->program_pix_clk);
-		ASSERT(otg_master->stream_res.pix_clk_params.controller_id >= CONTROLLER_ID_D0);
+		ASSERT_WARN(otg_master);
+		ASSERT_WARN(otg_master->clock_source);
+		ASSERT_WARN(otg_master->clock_source->funcs->program_pix_clk);
+		ASSERT_WARN(otg_master->stream_res.pix_clk_params.controller_id >= CONTROLLER_ID_D0);
 
 		use_hpo_encoder = dccg->ctx->dc->link_srv->dp_is_128b_132b_signal(otg_master);
 		if (!use_hpo_encoder)
@@ -549,7 +549,7 @@ static void dcn401_update_clocks_update_dpp_dto(struct clk_mgr_internal *clk_mgr
 			/* The software state is not valid if dpp resource is NULL and
 			 * dppclk_khz > 0.
 			 */
-			ASSERT(false);
+			ASSERT_WARN(false);
 			continue;
 		}
 
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 49fe7dcf9372..7312974bdbd1 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -2300,7 +2300,7 @@ static void process_deferred_updates(struct dc *dc)
 	int i = 0;
 
 	if (dc->debug.enable_mem_low_power.bits.cm) {
-		ASSERT(dc->dcn_ip->max_num_dpp);
+		ASSERT_WARN(dc->dcn_ip->max_num_dpp);
 		for (i = 0; i < dc->dcn_ip->max_num_dpp; i++)
 			if (dc->res_pool->dpps[i]->funcs->dpp_deferred_update)
 				dc->res_pool->dpps[i]->funcs->dpp_deferred_update(dc->res_pool->dpps[i]);
@@ -3079,7 +3079,7 @@ static void copy_stream_update_to_stream(struct dc *dc,
 		int i;
 
 		stream->num_wb_info = update->wb_update->num_wb_info;
-		ASSERT(stream->num_wb_info <= MAX_DWB_PIPES);
+		ASSERT_WARN(stream->num_wb_info <= MAX_DWB_PIPES);
 		for (i = 0; i < stream->num_wb_info; i++)
 			stream->writeback_info[i] =
 				update->wb_update->writeback_info[i];
@@ -3223,7 +3223,7 @@ static bool update_planes_and_stream_state(struct dc *dc,
 
 	if (!stream_status) {
 		if (surface_count) /* Only an error condition if surf_count non-zero*/
-			ASSERT(false);
+			ASSERT_WARN(false);
 
 		return false; /* Cannot commit surface to stream that is not committed */
 	}
@@ -3871,7 +3871,7 @@ static void commit_planes_for_stream(struct dc *dc,
 	top_pipe_to_program = resource_get_otg_master_for_stream(
 				&context->res_ctx,
 				stream);
-	ASSERT(top_pipe_to_program != NULL);
+	ASSERT_WARN(top_pipe_to_program != NULL);
 	for (i = 0; i < dc->res_pool->pipe_count; i++) {
 		struct pipe_ctx *old_pipe = &dc->current_state->res_ctx.pipe_ctx[i];
 
@@ -4045,7 +4045,7 @@ static void commit_planes_for_stream(struct dc *dc,
 			if (update_type == UPDATE_TYPE_FAST)
 				continue;
 
-			ASSERT(!pipe_ctx->plane_state->triplebuffer_flips);
+			ASSERT_WARN(!pipe_ctx->plane_state->triplebuffer_flips);
 			if (dc->hwss.program_triplebuffer != NULL && dc->debug.enable_tri_buf) {
 				/*turn off triple buffer for full update*/
 				dc->hwss.program_triplebuffer(
@@ -5066,7 +5066,7 @@ static void commit_planes_and_stream_update_on_current_context(struct dc *dc,
 {
 	struct dc_fast_update fast_update[MAX_SURFACES] = {0};
 
-	ASSERT(update_type < UPDATE_TYPE_FULL);
+	ASSERT_WARN(update_type < UPDATE_TYPE_FULL);
 	populate_fast_updates(fast_update, srf_updates, surface_count,
 			stream_update);
 	if (fast_update_only(dc, fast_update, srf_updates, surface_count,
@@ -5097,7 +5097,7 @@ static void commit_planes_and_stream_update_with_new_context(struct dc *dc,
 		enum surface_update_type update_type,
 		struct dc_state *new_context)
 {
-	ASSERT(update_type >= UPDATE_TYPE_FULL);
+	ASSERT_WARN(update_type >= UPDATE_TYPE_FULL);
 	if (!dc->hwss.is_pipe_topology_transition_seamless(dc,
 			dc->current_state, new_context))
 		/*
@@ -5310,7 +5310,7 @@ void dc_set_power_state(struct dc *dc, enum dc_acpi_cm_power_state power_state)
 
 		break;
 	default:
-		ASSERT(dc->current_state->stream_count == 0);
+		ASSERT_WARN(dc->current_state->stream_count == 0);
 
 		dc_dmub_srv_notify_fw_dc_power_state(dc->ctx->dmub_srv, power_state);
 
@@ -5714,7 +5714,7 @@ bool dc_process_dmub_aux_transfer_async(struct dc *dc,
 	uint8_t action;
 	union dmub_rb_cmd cmd = {0};
 
-	ASSERT(payload->length <= 16);
+	ASSERT_WARN(payload->length <= 16);
 
 	cmd.dp_aux_access.header.type = DMUB_CMD__DP_AUX_ACCESS;
 	cmd.dp_aux_access.header.payload_bytes = 0;
@@ -5781,7 +5781,7 @@ uint8_t get_link_index_from_dpia_port_index(const struct dc *dc,
 			}
 		}
 	}
-	ASSERT(link_index != 0xFF);
+	ASSERT_WARN(link_index != 0xFF);
 	return link_index;
 }
 
@@ -5976,7 +5976,7 @@ void dc_notify_vsync_int_state(struct dc *dc, struct dc_stream_state *stream, bo
 	}
 
 	if (i == MAX_PIPES) {
-		ASSERT(0);
+		ASSERT_WARN(0);
 		return;
 	}
 
@@ -6027,7 +6027,7 @@ bool dc_abm_save_restore(
 	}
 
 	if (i == MAX_PIPES) {
-		ASSERT(0);
+		ASSERT_WARN(0);
 		return false;
 	}
 
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c
index 252af83e34a5..81d0cab4534d 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c
@@ -869,7 +869,7 @@ void hwss_execute_sequence(struct dc *dc,
 			dc->hwss.fams2_global_control_lock_fast(params);
 			break;
 		default:
-			ASSERT(false);
+			ASSERT_WARN(false);
 			break;
 		}
 	}
@@ -1067,7 +1067,7 @@ void hwss_wait_for_no_pipes_pending(struct dc *dc, struct dc_state *context)
 			udelay(1);
 			count++;
 		}
-		ASSERT(!pipe->plane_state->status.is_flip_pending);
+		ASSERT_WARN(!pipe->plane_state->status.is_flip_pending);
 	}
 }
 
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c
index 039b176e086d..65a3cf735dc7 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c
@@ -162,7 +162,7 @@ static void add_link_enc_assignment(
 		}
 
 		/* Attempted to add an encoder assignment for a stream not in dc_state. */
-		ASSERT(i != state->stream_count);
+		ASSERT_WARN(i != state->stream_count);
 	}
 }
 
@@ -305,15 +305,15 @@ void link_enc_cfg_link_encs_assign(
 	int i;
 	int j;
 
-	ASSERT(state->stream_count == stream_count);
-	ASSERT(dc->current_state->res_ctx.link_enc_cfg_ctx.mode == LINK_ENC_CFG_STEADY);
+	ASSERT_WARN(state->stream_count == stream_count);
+	ASSERT_WARN(dc->current_state->res_ctx.link_enc_cfg_ctx.mode == LINK_ENC_CFG_STEADY);
 
 	/* Release DIG link encoder resources before running assignment algorithm. */
 	for (i = 0; i < dc->current_state->stream_count; i++)
 		dc->res_pool->funcs->link_enc_unassign(state, dc->current_state->streams[i]);
 
 	for (i = 0; i < MAX_PIPES; i++)
-		ASSERT(state->res_ctx.link_enc_cfg_ctx.link_enc_assignments[i].valid == false);
+		ASSERT_WARN(state->res_ctx.link_enc_cfg_ctx.link_enc_assignments[i].valid == false);
 
 	/* (a) Assign DIG link encoders to physical (unmappable) endpoints first. */
 	for (i = 0; i < stream_count; i++) {
@@ -380,7 +380,7 @@ void link_enc_cfg_link_encs_assign(
 
 		/* Skip stream if not supported by DIG link encoder. */
 		if (!is_dig_link_enc_stream(stream)) {
-			ASSERT(stream->link->is_dig_mapping_flexible != true);
+			ASSERT_WARN(stream->link->is_dig_mapping_flexible != true);
 			continue;
 		}
 
@@ -735,7 +735,7 @@ bool link_enc_cfg_validate(struct dc *dc, struct dc_state *state)
 	}
 
 	is_valid = valid_entries && valid_stream_ptrs && valid_uniqueness && valid_avail && valid_streams;
-	ASSERT(is_valid);
+	ASSERT_WARN(is_valid);
 
 	if (is_valid == false) {
 		valid_bitmap =
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index 626f75b6ad00..65b7fdfb8965 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -899,7 +899,7 @@ static struct rect calculate_mpc_slice_in_timing_active(
 	mpc_rec.x = plane_clip_rec->x + mpc_rec.width * mpc_slice_idx;
 	mpc_rec.height = plane_clip_rec->height;
 	mpc_rec.y = plane_clip_rec->y;
-	ASSERT(mpc_slice_count == 1 ||
+	ASSERT_WARN(mpc_slice_count == 1 ||
 			stream->view_format != VIEW_3D_FORMAT_SIDE_BY_SIDE ||
 			mpc_rec.width % 2 == 0);
 
@@ -915,7 +915,7 @@ static struct rect calculate_mpc_slice_in_timing_active(
 	}
 
 	if (stream->view_format == VIEW_3D_FORMAT_TOP_AND_BOTTOM) {
-		ASSERT(mpc_rec.height % 2 == 0);
+		ASSERT_WARN(mpc_rec.height % 2 == 0);
 		mpc_rec.height /= 2;
 	}
 	return mpc_rec;
@@ -1320,7 +1320,7 @@ static void calculate_inits_and_viewports(struct pipe_ctx *pipe_ctx)
 	}
 	data->viewport.x += src.x;
 	data->viewport.y += src.y;
-	ASSERT(src.x % vpc_div == 0 && src.y % vpc_div == 0);
+	ASSERT_WARN(src.x % vpc_div == 0 && src.y % vpc_div == 0);
 	data->viewport_c.x += src.x / vpc_div;
 	data->viewport_c.y += src.y / vpc_div;
 }
@@ -1459,7 +1459,7 @@ bool resource_build_scaling_params(struct pipe_ctx *pipe_ctx)
 			!plane_state->dst_rect.height ||
 			!plane_state->src_rect.width ||
 			!plane_state->src_rect.height) {
-		ASSERT(0);
+		ASSERT_WARN(0);
 		return false;
 	}
 
@@ -1591,7 +1591,7 @@ bool resource_build_scaling_params(struct pipe_ctx *pipe_ctx)
 	 * This may break with rotation, good thing we aren't mixing hw rotation and 3d
 	 */
 	if (pipe_ctx->top_pipe && pipe_ctx->top_pipe->plane_state == plane_state) {
-		ASSERT(plane_state->rotation == ROTATION_ANGLE_0 ||
+		ASSERT_WARN(plane_state->rotation == ROTATION_ANGLE_0 ||
 			(pipe_ctx->stream->view_format != VIEW_3D_FORMAT_TOP_AND_BOTTOM &&
 				pipe_ctx->stream->view_format != VIEW_3D_FORMAT_SIDE_BY_SIDE));
 		if (pipe_ctx->stream->view_format == VIEW_3D_FORMAT_TOP_AND_BOTTOM)
@@ -1924,11 +1924,11 @@ int resource_get_opp_heads_for_otg_master(const struct pipe_ctx *otg_master,
 		DC_LOG_WARNING("%s called from a non OTG master, something "
 			       "is wrong in the pipe configuration",
 			       __func__);
-		ASSERT(0);
+		ASSERT_WARN(0);
 		return 0;
 	}
 	while (opp_head) {
-		ASSERT(i < MAX_PIPES);
+		ASSERT_WARN(i < MAX_PIPES);
 		opp_heads[i++] = opp_head;
 		opp_head = opp_head->next_odm_pipe;
 	}
@@ -1943,11 +1943,11 @@ int resource_get_dpp_pipes_for_opp_head(const struct pipe_ctx *opp_head,
 	int i = 0;
 
 	if (!resource_is_pipe_type(opp_head, OPP_HEAD)) {
-		ASSERT(0);
+		ASSERT_WARN(0);
 		return 0;
 	}
 	while (pipe && resource_is_pipe_type(pipe, DPP_PIPE)) {
-		ASSERT(i < MAX_PIPES);
+		ASSERT_WARN(i < MAX_PIPES);
 		dpp_pipes[i++] = pipe;
 		pipe = pipe->bottom_pipe;
 	}
@@ -1998,7 +1998,7 @@ struct pipe_ctx *resource_get_opp_head(const struct pipe_ctx *pipe_ctx)
 {
 	struct pipe_ctx *opp_head = (struct pipe_ctx *) pipe_ctx;
 
-	ASSERT(!resource_is_pipe_type(opp_head, FREE_PIPE));
+	ASSERT_WARN(!resource_is_pipe_type(opp_head, FREE_PIPE));
 	while (opp_head->top_pipe)
 		opp_head = opp_head->top_pipe;
 	return opp_head;
@@ -2008,7 +2008,7 @@ struct pipe_ctx *resource_get_primary_dpp_pipe(const struct pipe_ctx *dpp_pipe)
 {
 	struct pipe_ctx *pri_dpp_pipe = (struct pipe_ctx *) dpp_pipe;
 
-	ASSERT(resource_is_pipe_type(dpp_pipe, DPP_PIPE));
+	ASSERT_WARN(resource_is_pipe_type(dpp_pipe, DPP_PIPE));
 	while (pri_dpp_pipe->prev_odm_pipe)
 		pri_dpp_pipe = pri_dpp_pipe->prev_odm_pipe;
 	while (pri_dpp_pipe->top_pipe &&
@@ -2347,7 +2347,7 @@ static int resource_stream_to_stream_idx(struct dc_state *state,
 
 	/* never return negative array index */
 	if (stream_idx == -1) {
-		ASSERT(0);
+		ASSERT_WARN(0);
 		return 0;
 	}
 
@@ -2409,7 +2409,7 @@ static struct pipe_ctx *get_tail_pipe(
 static struct pipe_ctx *get_last_opp_head(
 		struct pipe_ctx *opp_head)
 {
-	ASSERT(resource_is_pipe_type(opp_head, OPP_HEAD));
+	ASSERT_WARN(resource_is_pipe_type(opp_head, OPP_HEAD));
 	while (opp_head->next_odm_pipe)
 		opp_head = opp_head->next_odm_pipe;
 	return opp_head;
@@ -2418,7 +2418,7 @@ static struct pipe_ctx *get_last_opp_head(
 static struct pipe_ctx *get_last_dpp_pipe_in_mpcc_combine(
 		struct pipe_ctx *dpp_pipe)
 {
-	ASSERT(resource_is_pipe_type(dpp_pipe, DPP_PIPE));
+	ASSERT_WARN(resource_is_pipe_type(dpp_pipe, DPP_PIPE));
 	while (dpp_pipe->bottom_pipe &&
 			dpp_pipe->plane_state == dpp_pipe->bottom_pipe->plane_state)
 		dpp_pipe = dpp_pipe->bottom_pipe;
@@ -2575,7 +2575,7 @@ static inline void release_hpo_dp_link_enc(
 		struct resource_context *res_ctx,
 		int enc_index)
 {
-	ASSERT(res_ctx->hpo_dp_link_enc_ref_cnts[enc_index] > 0);
+	ASSERT_WARN(res_ctx->hpo_dp_link_enc_ref_cnts[enc_index] > 0);
 	res_ctx->hpo_dp_link_enc_ref_cnts[enc_index]--;
 }
 
@@ -2646,9 +2646,9 @@ void resource_remove_otg_master_for_stream_output(struct dc_state *context,
 	if (!otg_master)
 		return;
 
-	ASSERT(resource_get_odm_slice_count(otg_master) == 1);
-	ASSERT(otg_master->plane_state == NULL);
-	ASSERT(otg_master->stream_res.stream_enc);
+	ASSERT_WARN(resource_get_odm_slice_count(otg_master) == 1);
+	ASSERT_WARN(otg_master->plane_state == NULL);
+	ASSERT_WARN(otg_master->stream_res.stream_enc);
 	update_stream_engine_usage(
 			&context->res_ctx,
 			pool,
@@ -2712,7 +2712,7 @@ static bool add_plane_to_opp_head_pipes(struct pipe_ctx *otg_master_pipe,
 
 	while (opp_head_pipe) {
 		if (opp_head_pipe->plane_state) {
-			ASSERT(0);
+			ASSERT_WARN(0);
 			return false;
 		}
 		opp_head_pipe->plane_state = plane_state;
@@ -2766,7 +2766,7 @@ static bool acquire_secondary_dpp_pipes_and_add_plane(
 	int i;
 
 	if (!pool->funcs->acquire_free_pipe_as_secondary_dpp_pipe) {
-		ASSERT(0);
+		ASSERT_WARN(0);
 		return false;
 	}
 
@@ -2782,7 +2782,7 @@ static bool acquire_secondary_dpp_pipes_and_add_plane(
 				new_ctx,
 				pool,
 				opp_heads[i]);
-		ASSERT(sec_pipe);
+		ASSERT_WARN(sec_pipe);
 		sec_pipe->plane_state = plane_state;
 
 		/* establish pipe relationship */
@@ -2791,7 +2791,7 @@ static bool acquire_secondary_dpp_pipes_and_add_plane(
 		sec_pipe->top_pipe = tail_pipe;
 		sec_pipe->bottom_pipe = NULL;
 		if (tail_pipe->prev_odm_pipe) {
-			ASSERT(tail_pipe->prev_odm_pipe->bottom_pipe);
+			ASSERT_WARN(tail_pipe->prev_odm_pipe->bottom_pipe);
 			sec_pipe->prev_odm_pipe = tail_pipe->prev_odm_pipe->bottom_pipe;
 			tail_pipe->prev_odm_pipe->bottom_pipe->next_odm_pipe = sec_pipe;
 		} else {
@@ -2907,7 +2907,7 @@ static bool acquire_pipes_and_add_odm_slice(
 			*new_top_dpp_pipe, *new_bottom_dpp_pipe;
 
 	if (!pool->funcs->acquire_free_pipe_as_secondary_opp_head) {
-		ASSERT(0);
+		ASSERT_WARN(0);
 		return false;
 	}
 	new_opp_head = pool->funcs->acquire_free_pipe_as_secondary_opp_head(
@@ -2984,7 +2984,7 @@ static bool release_pipes_and_remove_odm_slice(
 	struct pipe_ctx *tail_pipe = get_tail_pipe(last_opp_head);
 
 	if (!pool->funcs->release_pipe) {
-		ASSERT(0);
+		ASSERT_WARN(0);
 		return false;
 	}
 
@@ -3046,7 +3046,7 @@ static bool acquire_dpp_pipe_and_add_mpc_slice(
 	struct pipe_ctx *new_dpp_pipe;
 
 	if (!pool->funcs->acquire_free_pipe_as_secondary_dpp_pipe) {
-		ASSERT(0);
+		ASSERT_WARN(0);
 		return false;
 	}
 	new_dpp_pipe = pool->funcs->acquire_free_pipe_as_secondary_dpp_pipe(
@@ -3106,7 +3106,7 @@ static bool release_dpp_pipe_and_remove_mpc_slice(
 			get_last_dpp_pipe_in_mpcc_combine(dpp_pipe);
 
 	if (!pool->funcs->release_pipe) {
-		ASSERT(0);
+		ASSERT_WARN(0);
 		return false;
 	}
 
@@ -3172,7 +3172,7 @@ bool resource_update_pipes_for_plane_with_slice_count(
 
 	dpp_pipe_count = resource_get_dpp_pipes_for_plane(plane,
 			&new_ctx->res_ctx, dpp_pipes);
-	ASSERT(dpp_pipe_count > 0);
+	ASSERT_WARN(dpp_pipe_count > 0);
 	cur_slice_count = resource_get_mpc_slice_count(dpp_pipes[0]);
 
 	if (new_slice_count == cur_slice_count)
@@ -3393,7 +3393,7 @@ static int get_norm_pix_clk(const struct dc_crtc_timing *timing)
 			normalized_pix_clk = (pix_clk * 48) / 24;
 		break;
 		default:
-			ASSERT(0);
+			ASSERT_WARN(0);
 		break;
 		}
 	}
@@ -3773,7 +3773,7 @@ static bool planes_changed_for_existing_stream(struct dc_state *context,
 	}
 
 	if (!stream_status) {
-		ASSERT(0);
+		ASSERT_WARN(0);
 		return false;
 	}
 
@@ -3782,7 +3782,7 @@ static bool planes_changed_for_existing_stream(struct dc_state *context,
 			break;
 
 	if (i == set_count)
-		ASSERT(0);
+		ASSERT_WARN(0);
 
 	if (set[i].plane_count != stream_status->plane_count)
 		return true;
@@ -5200,7 +5200,7 @@ bool dc_resource_acquire_secondary_pipe_for_mpc_odm_legacy(
 #if defined(CONFIG_DRM_AMD_DC_FP)
 			dcn20_acquire_dsc(dc, &state->res_ctx, &sec_pipe->stream_res.dsc, sec_pipe->stream_res.opp->inst);
 #endif
-			ASSERT(sec_pipe->stream_res.dsc);
+			ASSERT_WARN(sec_pipe->stream_res.dsc);
 			if (sec_pipe->stream_res.dsc == NULL)
 				return false;
 		}
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stat.c b/drivers/gpu/drm/amd/display/dc/core/dc_stat.c
index fe9f99f1bdf9..ed646a0ce82d 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_stat.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_stat.c
@@ -56,7 +56,7 @@ void dc_stat_get_dmub_notification(const struct dc *dc, struct dmub_notification
 	enum dmub_status status;
 
 	status = dmub_srv_stat_get_notification(dmub, notify);
-	ASSERT(status == DMUB_STATUS_OK);
+	ASSERT_WARN(status == DMUB_STATUS_OK);
 
 	/* For HPD/HPD RX, convert dpia port index into link index */
 	if (notify->type == DMUB_NOTIFICATION_HPD ||
@@ -86,5 +86,5 @@ void dc_stat_get_dmub_dataout(const struct dc *dc, uint32_t *dataout)
 	enum dmub_status status;
 
 	status = dmub_srv_get_gpint_dataout(dmub, dataout);
-	ASSERT(status == DMUB_STATUS_OK);
+	ASSERT_WARN(status == DMUB_STATUS_OK);
 }
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
index 55dc482d9b36..f596b6c96ce1 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
@@ -488,7 +488,7 @@ bool dc_stream_add_writeback(struct dc *dc,
 	}
 
 	if (!isDrc) {
-		ASSERT(stream->num_wb_info + 1 <= MAX_DWB_PIPES);
+		ASSERT_WARN(stream->num_wb_info + 1 <= MAX_DWB_PIPES);
 		stream->writeback_info[stream->num_wb_info++] = *wb_info;
 	}
 
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_surface.c b/drivers/gpu/drm/amd/display/dc/core/dc_surface.c
index ccbb15f1638c..0e7cd6c8a835 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_surface.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_surface.c
@@ -125,7 +125,7 @@ const struct dc_plane_status *dc_plane_get_status(
 	if (!plane_state ||
 		!plane_state->ctx ||
 		!plane_state->ctx->dc) {
-		ASSERT(0);
+		ASSERT_WARN(0);
 		return NULL; /* remove this if above assert never hit */
 	}
 
diff --git a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
index f90fc154549a..9cb8d113649a 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
+++ b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
@@ -1440,7 +1440,7 @@ static void dc_dmub_srv_exit_low_power_state(const struct dc *dc)
 					ips_fw->signals.bits.ips2_commit);
 
 				if (!dc_dmub_srv_is_hw_pwr_up(dc->ctx->dmub_srv, true))
-					ASSERT(0);
+					ASSERT_WARN(0);
 
 				DC_LOG_IPS(
 					"resync inbox1 (ips1_commit=%u ips2_commit=%u)",
@@ -1469,7 +1469,7 @@ static void dc_dmub_srv_exit_low_power_state(const struct dc *dc)
 	}
 
 	if (!dc_dmub_srv_is_hw_pwr_up(dc->ctx->dmub_srv, true))
-		ASSERT(0);
+		ASSERT_WARN(0);
 
 	DC_LOG_IPS("%s exit (count rcg=%u ips1=%u ips2=%u)",
 		__func__,
@@ -1587,7 +1587,7 @@ void dc_dmub_srv_apply_idle_power_optimizations(const struct dc *dc, bool allow_
 
 		dc_dmub_srv->idle_exit_counter -= 1;
 		if (dc_dmub_srv->idle_exit_counter < 0) {
-			ASSERT(0);
+			ASSERT_WARN(0);
 			dc_dmub_srv->idle_exit_counter = 0;
 		}
 	} else {
diff --git a/drivers/gpu/drm/amd/display/dc/dc_helper.c b/drivers/gpu/drm/amd/display/dc/dc_helper.c
index b402be59b2c8..dbe0cc665d78 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_helper.c
+++ b/drivers/gpu/drm/amd/display/dc/dc_helper.c
@@ -97,7 +97,7 @@ static inline void set_reg_field_value_masks(
 	uint32_t mask,
 	uint8_t shift)
 {
-	ASSERT(mask != 0);
+	ASSERT_WARN(mask != 0);
 
 	field_value_mask->value = (field_value_mask->value & ~mask) | (mask & (value << shift));
 	field_value_mask->mask = field_value_mask->mask | mask;
@@ -446,7 +446,7 @@ void generic_reg_wait(const struct dc_context *ctx,
 	 * This value comes from experiments.
 	 *
 	 */
-	ASSERT(delay_between_poll_us * time_out_num_tries <= 3000000);
+	ASSERT_WARN(delay_between_poll_us * time_out_num_tries <= 3000000);
 
 	for (i = 0; i <= time_out_num_tries; i++) {
 		if (i) {
@@ -493,7 +493,7 @@ uint32_t generic_read_indirect_reg(const struct dc_context *ctx,
 	// when reg read, there should not be any offload.
 	if (ctx->dmub_srv &&
 	    ctx->dmub_srv->reg_helper_offload.gather_in_progress) {
-		ASSERT(false);
+		ASSERT_WARN(false);
 	}
 
 	dm_write_reg(ctx, addr_index, index);
@@ -635,7 +635,7 @@ void reg_sequence_start_gather(const struct dc_context *ctx)
 			&ctx->dmub_srv->reg_helper_offload;
 
 		/* caller sequence mismatch.  need to debug caller.  offload will not work!!! */
-		ASSERT(!offload->gather_in_progress);
+		ASSERT_WARN(!offload->gather_in_progress);
 
 		offload->gather_in_progress = true;
 	}
diff --git a/drivers/gpu/drm/amd/display/dc/dccg/dcn20/dcn20_dccg.c b/drivers/gpu/drm/amd/display/dc/dccg/dcn20/dcn20_dccg.c
index 5999b2da3a01..d66da0814ad5 100644
--- a/drivers/gpu/drm/amd/display/dc/dccg/dcn20/dcn20_dccg.c
+++ b/drivers/gpu/drm/amd/display/dc/dccg/dcn20/dcn20_dccg.c
@@ -57,7 +57,7 @@ void dccg2_update_dpp_dto(struct dccg *dccg, int dpp_inst, int req_dppclk)
 		phase = ((modulo * req_dppclk) + ref_dppclk - 1) / ref_dppclk;
 
 		if (phase > 0xff) {
-			ASSERT(false);
+			ASSERT_WARN(false);
 			phase = 0xff;
 		}
 
diff --git a/drivers/gpu/drm/amd/display/dc/dccg/dcn31/dcn31_dccg.c b/drivers/gpu/drm/amd/display/dc/dccg/dcn31/dcn31_dccg.c
index 8664f0c4c9b7..2d76ec6581ad 100644
--- a/drivers/gpu/drm/amd/display/dc/dccg/dcn31/dcn31_dccg.c
+++ b/drivers/gpu/drm/amd/display/dc/dccg/dcn31/dcn31_dccg.c
@@ -64,7 +64,7 @@ void dccg31_update_dpp_dto(struct dccg *dccg, int dpp_inst, int req_dppclk)
 		phase = ((modulo * req_dppclk) + ref_dppclk - 1) / ref_dppclk;
 
 		if (phase > 0xff) {
-			ASSERT(false);
+			ASSERT_WARN(false);
 			phase = 0xff;
 		}
 
diff --git a/drivers/gpu/drm/amd/display/dc/dccg/dcn35/dcn35_dccg.c b/drivers/gpu/drm/amd/display/dc/dccg/dcn35/dcn35_dccg.c
index b363f5360818..24f6ee9c3742 100644
--- a/drivers/gpu/drm/amd/display/dc/dccg/dcn35/dcn35_dccg.c
+++ b/drivers/gpu/drm/amd/display/dc/dccg/dcn35/dcn35_dccg.c
@@ -1160,7 +1160,7 @@ static void dccg35_update_dpp_dto(struct dccg *dccg, int dpp_inst,
 		phase = ((modulo * req_dppclk) + ref_dppclk - 1) / ref_dppclk;
 
 		if (phase > 0xff) {
-			ASSERT(false);
+			ASSERT_WARN(false);
 			phase = 0xff;
 		}
 
@@ -2124,7 +2124,7 @@ static void dccg35_update_dpp_dto_cb(struct dccg *dccg, int dpp_inst,
 		phase = ((modulo * req_dppclk) + ref_dppclk - 1) / ref_dppclk;
 
 		if (phase > 0xff) {
-			ASSERT(false);
+			ASSERT_WARN(false);
 			phase = 0xff;
 		}
 
diff --git a/drivers/gpu/drm/amd/display/dc/dccg/dcn401/dcn401_dccg.c b/drivers/gpu/drm/amd/display/dc/dccg/dcn401/dcn401_dccg.c
index d3e46c3cfa57..9646954550d6 100644
--- a/drivers/gpu/drm/amd/display/dc/dccg/dcn401/dcn401_dccg.c
+++ b/drivers/gpu/drm/amd/display/dc/dccg/dcn401/dcn401_dccg.c
@@ -87,7 +87,7 @@ void dccg401_update_dpp_dto(struct dccg *dccg, int dpp_inst, int req_dppclk)
 		phase = ((modulo * req_dppclk) + ref_dppclk - 1) / ref_dppclk;
 
 		if (phase > 0xff) {
-			ASSERT(false);
+			ASSERT_WARN(false);
 			phase = 0xff;
 		}
 
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_audio.c b/drivers/gpu/drm/amd/display/dc/dce/dce_audio.c
index eeed840073fe..09d49b6e182b 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_audio.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_audio.c
@@ -258,7 +258,7 @@ static struct fixed31_32 get_link_symbol_clk_freq_mhz(enum dc_link_rate link_rat
 		return dc_fixpt_from_int(625); /* 625 MHz */
 	default:
 		/* Unexpected case, this requires debug if encountered. */
-		ASSERT(0);
+		ASSERT_WARN(0);
 		return dc_fixpt_from_int(0);
 	}
 }
@@ -316,7 +316,7 @@ static uint32_t get_av_stream_map_lane_count(
 		av_stream_map_lane_count = 4;
 	}
 
-	ASSERT(av_stream_map_lane_count != 0);
+	ASSERT_WARN(av_stream_map_lane_count != 0);
 
 	return av_stream_map_lane_count;
 }
@@ -337,7 +337,7 @@ static uint32_t get_audio_sdp_overhead(
 		audio_sdp_overhead = 10; /* 4 x 2.5 */
 	}
 
-	ASSERT(audio_sdp_overhead != 0);
+	ASSERT_WARN(audio_sdp_overhead != 0);
 
 	return audio_sdp_overhead;
 }
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/dce/dce_clk_mgr.c
index e7acd6eec1fd..6864a1fc2055 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_clk_mgr.c
@@ -153,9 +153,9 @@ static int dce_get_dp_ref_freq_khz(struct clk_mgr *clk_mgr)
 	int dp_ref_clk_khz = 600000;
 	int target_div;
 
-	/* ASSERT DP Reference Clock source is from DFS*/
+	/* ASSERT_WARN DP Reference Clock source is from DFS*/
 	REG_GET(DPREFCLK_CNTL, DPREFCLK_SRC_SEL, &dprefclk_src_sel);
-	ASSERT(dprefclk_src_sel == 0);
+	ASSERT_WARN(dprefclk_src_sel == 0);
 
 	/* Read the mmDENTIST_DISPCLK_CNTL to get the currently
 	 * programmed DID DENTIST_DPREFCLK_WDIVIDER*/
@@ -513,7 +513,7 @@ void dce110_fill_display_configs(
 				break;
 			}
 
-		ASSERT(pipe_ctx != NULL);
+		ASSERT_WARN(pipe_ctx != NULL);
 
 		/* only notify active stream */
 		if (stream->dpms_off)
@@ -591,7 +591,7 @@ static int determine_sclk_from_bounding_box(
 	 * is unexpected at this stage, should have been caught at
 	 * validation time
 	 */
-	ASSERT(0);
+	ASSERT_WARN(0);
 	return dc->sclk_lvls.clocks_in_khz[dc->sclk_lvls.num_levels - 1];
 }
 
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c b/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c
index b700608e4240..42aef145b2a8 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c
@@ -504,7 +504,7 @@ static uint32_t dce110_get_pix_clk_dividers_helper (
 
 	/* Check VBIOS AdjustPixelClock Exec table */
 	if (!pll_adjust_pix_clk(clk_src, pix_clk_params, pll_settings)) {
-		/* Should never happen, ASSERT and fill up values to be able
+		/* Should never happen, ASSERT_WARN and fill up values to be able
 		 * to continue. */
 		DC_LOG_ERROR(
 			"%s: Failed to adjust pixel clock!!", __func__);
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_dmcu.c b/drivers/gpu/drm/amd/display/dc/dce/dce_dmcu.c
index a8e79104b684..3a9b9ddc64fb 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_dmcu.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_dmcu.c
@@ -592,7 +592,7 @@ static void dcn10_dmcu_set_psr_enable(struct dmcu *dmcu, bool enable, bool wait)
 
 		/* assert if max retry hit */
 		if (retryCount >= 1000)
-			ASSERT(0);
+			ASSERT_WARN(0);
 	}
 }
 
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_i2c_sw.c b/drivers/gpu/drm/amd/display/dc/dce/dce_i2c_sw.c
index e188447c8156..97adbded18a4 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_i2c_sw.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_i2c_sw.c
@@ -341,7 +341,7 @@ static void dce_i2c_sw_engine_set_speed(
 	struct dce_i2c_sw *engine,
 	uint32_t speed)
 {
-	ASSERT(speed);
+	ASSERT_WARN(speed);
 
 	engine->speed = speed ? speed : DCE_I2C_DEFAULT_I2C_SW_SPEED;
 
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_ipp.c b/drivers/gpu/drm/amd/display/dc/dce/dce_ipp.c
index 34bff9aef66c..aa5ce7fad271 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_ipp.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_ipp.c
@@ -221,7 +221,7 @@ static void dce_ipp_set_degamma(
 	struct dce_ipp *ipp_dce = TO_DCE_IPP(ipp);
 	uint32_t degamma_type = (mode == IPP_DEGAMMA_MODE_HW_sRGB) ? 1 : 0;
 
-	ASSERT(mode == IPP_DEGAMMA_MODE_BYPASS || mode == IPP_DEGAMMA_MODE_HW_sRGB);
+	ASSERT_WARN(mode == IPP_DEGAMMA_MODE_BYPASS || mode == IPP_DEGAMMA_MODE_HW_sRGB);
 
 	REG_SET_3(DEGAMMA_CONTROL, 0,
 		  GRPH_DEGAMMA_MODE, degamma_type,
@@ -237,7 +237,7 @@ static void dce60_ipp_set_degamma(
 	struct dce_ipp *ipp_dce = TO_DCE_IPP(ipp);
 	uint32_t degamma_type = (mode == IPP_DEGAMMA_MODE_HW_sRGB) ? 1 : 0;
 
-	ASSERT(mode == IPP_DEGAMMA_MODE_BYPASS || mode == IPP_DEGAMMA_MODE_HW_sRGB);
+	ASSERT_WARN(mode == IPP_DEGAMMA_MODE_BYPASS || mode == IPP_DEGAMMA_MODE_HW_sRGB);
 	/* DCE6 does not have CURSOR2_DEGAMMA_MODE bit in DEGAMMA_CONTROL reg */
 	REG_SET_2(DEGAMMA_CONTROL, 0,
 		  GRPH_DEGAMMA_MODE, degamma_type,
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_link_encoder.c b/drivers/gpu/drm/amd/display/dc/dce/dce_link_encoder.c
index 4a9d07c31bc5..ef5d73bb4cbc 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_link_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_link_encoder.c
@@ -302,7 +302,7 @@ static void setup_panel_mode(
 	if (ctx->dc->caps.psp_setup_panel_mode)
 		return;
 
-	ASSERT(REG(DP_DPHY_INTERNAL_CTRL));
+	ASSERT_WARN(REG(DP_DPHY_INTERNAL_CTRL));
 	value = REG_READ(DP_DPHY_INTERNAL_CTRL);
 
 	switch (panel_mode) {
@@ -448,7 +448,7 @@ static void set_dp_phy_pattern_hbr2_compliance_cp2520_2(
 				DP_DPHY_HBR2_PATTERN_CONTROL, cp2520_pattern);
 	else
 		/* pre-DCE11 can only generate CP2520 pattern 2 */
-		ASSERT(cp2520_pattern == 2);
+		ASSERT_WARN(cp2520_pattern == 2);
 
 	/* set link training complete */
 	set_link_training_complete(enc110, true);
@@ -500,7 +500,7 @@ static void dce60_set_dp_phy_pattern_hbr2_compliance_cp2520_2(
 				DP_DPHY_HBR2_PATTERN_CONTROL, cp2520_pattern);
 	else
 		/* pre-DCE11 can only generate CP2520 pattern 2 */
-		ASSERT(cp2520_pattern == 2);
+		ASSERT_WARN(cp2520_pattern == 2);
 
 	/* set link training complete */
 	set_link_training_complete(enc110, true);
@@ -986,7 +986,7 @@ void dce110_link_encoder_hw_init(
 
 		result = link_transmitter_control(enc110, &cntl);
 
-		ASSERT(result == BP_RESULT_OK);
+		ASSERT_WARN(result == BP_RESULT_OK);
 
 	}
 	aux_initialize(enc110);
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.c b/drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.c
index f5e1d9caee4c..80440c04eb19 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.c
@@ -690,8 +690,8 @@ static uint32_t get_dmif_switch_time_us(
 
 	if (!pixels_per_second || !pixels_per_frame) {
 		/* avoid division by zero */
-		ASSERT(pixels_per_frame);
-		ASSERT(pixels_per_second);
+		ASSERT_WARN(pixels_per_frame);
+		ASSERT_WARN(pixels_per_second);
 		return single_frame_time_multiplier * min_single_frame_time_us;
 	}
 
@@ -699,7 +699,7 @@ static uint32_t get_dmif_switch_time_us(
 
 	if (!refresh_rate) {
 		/* avoid division by zero*/
-		ASSERT(refresh_rate);
+		ASSERT_WARN(refresh_rate);
 		return single_frame_time_multiplier * min_single_frame_time_us;
 	}
 
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_stream_encoder.c b/drivers/gpu/drm/amd/display/dc/dce/dce_stream_encoder.c
index d199e4ed2e59..d5d6f2a208d1 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_stream_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_stream_encoder.c
@@ -75,7 +75,7 @@ static void dce110_update_generic_info_packet(
 
 	if (REG(AFMT_VBI_PACKET_CONTROL1)) {
 		if (packet_index >= 8)
-			ASSERT(0);
+			ASSERT_WARN(0);
 
 		/* poll dig_update_lock is not locked -> asic internal signal
 		 * assume otg master lock will unlock it
@@ -665,8 +665,8 @@ static void dce110_stream_encoder_dvi_set_stream_attribute(
 			enc110->base.bp, &cntl) != BP_RESULT_OK)
 		return;
 
-	ASSERT(crtc_timing->pixel_encoding == PIXEL_ENCODING_RGB);
-	ASSERT(crtc_timing->display_color_depth == COLOR_DEPTH_888);
+	ASSERT_WARN(crtc_timing->pixel_encoding == PIXEL_ENCODING_RGB);
+	ASSERT_WARN(crtc_timing->display_color_depth == COLOR_DEPTH_888);
 	dce110_stream_encoder_set_stream_attribute_helper(enc110, crtc_timing);
 }
 
@@ -689,7 +689,7 @@ static void dce110_stream_encoder_lvds_set_stream_attribute(
 			enc110->base.bp, &cntl) != BP_RESULT_OK)
 		return;
 
-	ASSERT(crtc_timing->pixel_encoding == PIXEL_ENCODING_RGB);
+	ASSERT_WARN(crtc_timing->pixel_encoding == PIXEL_ENCODING_RGB);
 }
 
 static void dce110_stream_encoder_set_throttled_vcp_size(
@@ -1237,7 +1237,7 @@ static void dce110_se_audio_setup(
 
 	uint32_t channels = 0;
 
-	ASSERT(audio_info);
+	ASSERT_WARN(audio_info);
 	if (audio_info == NULL)
 		/* This should not happen.it does so we don't get BSOD*/
 		return;
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_transform.c b/drivers/gpu/drm/amd/display/dc/dce/dce_transform.c
index 2b1673d69ea8..149b8e8485d5 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_transform.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_transform.c
@@ -794,7 +794,7 @@ static void program_bit_depth_reduction(
 	enum dcp_out_trunc_round_mode trunc_mode;
 	bool spatial_dither_enable;
 
-	ASSERT(depth <= COLOR_DEPTH_121212); /* Invalid clamp bit depth */
+	ASSERT_WARN(depth <= COLOR_DEPTH_121212); /* Invalid clamp bit depth */
 
 	spatial_dither_enable = bit_depth_params->flags.SPATIAL_DITHER_ENABLED;
 	/* Default to 12 bit truncation without rounding */
@@ -854,7 +854,7 @@ static void dce60_program_bit_depth_reduction(
 	enum dcp_out_trunc_round_mode trunc_mode;
 	bool spatial_dither_enable;
 
-	ASSERT(depth <= COLOR_DEPTH_121212); /* Invalid clamp bit depth */
+	ASSERT_WARN(depth <= COLOR_DEPTH_121212); /* Invalid clamp bit depth */
 
 	spatial_dither_enable = bit_depth_params->flags.SPATIAL_DITHER_ENABLED;
 	/* Default to 12 bit truncation without rounding */
@@ -903,7 +903,7 @@ static int dce_transform_get_max_num_of_supported_lines(
 	int pixels_per_entries = 0;
 	int max_pixels_supports = 0;
 
-	ASSERT(pixel_width);
+	ASSERT_WARN(pixel_width);
 
 	/* Find number of pixels that can fit into a single LB entry and
 	 * take floor of the value since we cannot store a single pixel
@@ -932,7 +932,7 @@ static int dce_transform_get_max_num_of_supported_lines(
 		break;
 	}
 
-	ASSERT(pixels_per_entries);
+	ASSERT_WARN(pixels_per_entries);
 
 	max_pixels_supports =
 			pixels_per_entries *
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c b/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
index cae18f8c1c9a..10416c5e6128 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
@@ -123,7 +123,7 @@ static void dmub_psr_get_state(struct dmub_psr *dmub, enum dc_psr_state *state,
 
 	// Assert if max retry hit
 	if (retry_count >= 1000 && *state == PSR_STATE_INVALID) {
-		ASSERT(0);
+		ASSERT_WARN(0);
 		DC_TRACE_LEVEL_MESSAGE(DAL_TRACE_LEVEL_ERROR,
 				WPP_BIT_FLAG_Firmware_PsrState,
 				"Unable to get PSR state from FW.");
@@ -220,7 +220,7 @@ static void dmub_psr_enable(struct dmub_psr *dmub, bool enable, bool wait, uint8
 
 		/* assert if max retry hit */
 		if (retry_count >= 1000)
-			ASSERT(0);
+			ASSERT_WARN(0);
 	}
 }
 
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_replay.c b/drivers/gpu/drm/amd/display/dc/dce/dmub_replay.c
index c31e4f26a305..42e8f4133f87 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dmub_replay.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_replay.c
@@ -35,7 +35,7 @@ static void dmub_replay_get_state(struct dmub_replay *dmub, enum replay_state *s
 
 	// Assert if max retry hit
 	if (retry_count >= 1000 && *state == REPLAY_STATE_INVALID) {
-		ASSERT(0);
+		ASSERT_WARN(0);
 		/* To-do: Add retry fail log */
 	}
 }
@@ -86,7 +86,7 @@ static void dmub_replay_enable(struct dmub_replay *dmub, bool enable, bool wait,
 
 		/* assert if max retry hit */
 		if (retry_count >= 1000)
-			ASSERT(0);
+			ASSERT_WARN(0);
 	}
 }
 
diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_timing_generator.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_timing_generator.c
index fa422a8cbced..ee4aee67c65d 100644
--- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_timing_generator.c
+++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_timing_generator.c
@@ -1120,7 +1120,7 @@ bool dce110_timing_generator_validate_timing(
 
 	struct dce110_timing_generator *tg110 = DCE110TG_FROM_TG(tg);
 
-	ASSERT(timing != NULL);
+	ASSERT_WARN(timing != NULL);
 
 	if (!timing)
 		return false;
diff --git a/drivers/gpu/drm/amd/display/dc/dce60/dce60_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dce60/dce60_hw_sequencer.c
index 1fdeef47e4dc..aae276adba3e 100644
--- a/drivers/gpu/drm/amd/display/dc/dce60/dce60_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dce60/dce60_hw_sequencer.c
@@ -57,7 +57,7 @@ static bool dce60_should_enable_fbc(struct dc *dc,
 	unsigned int underlay_idx = dc->res_pool->underlay_pipe_index;
 
 
-	ASSERT(dc->fbc_compressor);
+	ASSERT_WARN(dc->fbc_compressor);
 
 	/* FBC memory should be allocated */
 	if (!dc->ctx->fbc_gpu_addr)
diff --git a/drivers/gpu/drm/amd/display/dc/dce60/dce60_resource.c b/drivers/gpu/drm/amd/display/dc/dce60/dce60_resource.c
index 889f314cac65..e9fa6d928d23 100644
--- a/drivers/gpu/drm/amd/display/dc/dce60/dce60_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dce60/dce60_resource.c
@@ -468,7 +468,7 @@ static int map_transmitter_id_to_phy_instance(
 	case TRANSMITTER_UNIPHY_G:
 		return 6;
 	default:
-		ASSERT(0);
+		ASSERT_WARN(0);
 		return 0;
 	}
 }
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_vmid.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_vmid.c
index 5bc3bc60a2ac..22b4c658044e 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_vmid.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_vmid.c
@@ -70,7 +70,7 @@ static void dcn20_wait_for_vmid_ready(struct dcn20_vmid *vmid)
 
 	/* VM setup timed out */
 	DC_LOG_WARNING("Timeout while waiting for GPUVM context update\n");
-	ASSERT(0);
+	ASSERT_WARN(0);
 }
 
 void dcn20_vmid_setup(struct dcn20_vmid *vmid, const struct dcn_vmid_page_table_config *config)
diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_link_encoder.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_link_encoder.c
index eb9abb9f9698..ad6f2dd510a1 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_link_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_link_encoder.c
@@ -212,7 +212,7 @@ static bool dcn21_link_encoder_acquire_phy(struct link_encoder *enc)
 				RDPCS_PHY_DPALT_DISABLE, &value);
 
 		if (value == 1) {
-			ASSERT(0);
+			ASSERT_WARN(0);
 			return false;
 		}
 		REG_UPDATE(RDPCSTX_PHY_CNTL6,
@@ -223,7 +223,7 @@ static bool dcn21_link_encoder_acquire_phy(struct link_encoder *enc)
 		REG_GET(RDPCSTX_PHY_CNTL6,
 						RDPCS_PHY_DPALT_DISABLE, &value);
 		if (value == 1) {
-			ASSERT(0);
+			ASSERT_WARN(0);
 			REG_UPDATE(RDPCSTX_PHY_CNTL6,
 					RDPCS_PHY_DPALT_DISABLE_ACK, 1);
 			return false;
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_afmt.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_afmt.c
index 55e388c4c98b..f91367caa214 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_afmt.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_afmt.c
@@ -125,7 +125,7 @@ void afmt3_se_audio_setup(
 
 	uint32_t channels = 0;
 
-	ASSERT(audio_info);
+	ASSERT_WARN(audio_info);
 	/* This should not happen.it does so we don't get BSOD*/
 	if (audio_info == NULL)
 		return;
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_vpg.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_vpg.c
index 14bc44b1f886..79acb84ca78a 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_vpg.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_vpg.c
@@ -58,7 +58,7 @@ void vpg3_update_generic_info_packet(
 	uint32_t max_retries = 50;
 
 	if (packet_index > 14)
-		ASSERT(0);
+		ASSERT_WARN(0);
 
 	/* poll dig_update_lock is not locked -> asic internal signal
 	 * assume otg master lock will unlock it
diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.c
index 05aac3e444b4..d4a7b52f326c 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_apg.c
@@ -79,7 +79,7 @@ static void apg31_se_audio_setup(
 {
 	struct dcn31_apg *apg31 = DCN31_APG_FROM_APG(apg);
 
-	ASSERT(audio_info);
+	ASSERT_WARN(audio_info);
 	/* This should not happen.it does so we don't get BSOD*/
 	if (audio_info == NULL)
 		return;
diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_panel_cntl.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_panel_cntl.c
index 573898984726..703802ab91a2 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_panel_cntl.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_panel_cntl.c
@@ -183,7 +183,7 @@ void dcn31_panel_cntl_construct(
 		break;
 	default:
 		DC_LOG_WARNING("Unsupported pwrseq engine id: %d!\n", init_data->eng_id);
-		ASSERT(false);
+		ASSERT_WARN(false);
 		break;
 	}
 
diff --git a/drivers/gpu/drm/amd/display/dc/dio/dcn10/dcn10_link_encoder.c b/drivers/gpu/drm/amd/display/dc/dio/dcn10/dcn10_link_encoder.c
index e0558a78b11c..2e32273752f3 100644
--- a/drivers/gpu/drm/amd/display/dc/dio/dcn10/dcn10_link_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dio/dcn10/dcn10_link_encoder.c
@@ -380,7 +380,7 @@ static void set_dp_phy_pattern_hbr2_compliance_cp2520_2(
 				DP_DPHY_HBR2_PATTERN_CONTROL, cp2520_pattern);
 	else
 		/* pre-DCE11 can only generate CP2520 pattern 2 */
-		ASSERT(cp2520_pattern == 2);
+		ASSERT_WARN(cp2520_pattern == 2);
 
 	/* set link training complete */
 	set_link_training_complete(enc10, true);
@@ -857,7 +857,7 @@ void dcn10_link_encoder_hw_init(
 
 		result = link_transmitter_control(enc10, &cntl);
 
-		ASSERT(result == BP_RESULT_OK);
+		ASSERT_WARN(result == BP_RESULT_OK);
 
 	}
 	dcn10_aux_initialize(enc10);
diff --git a/drivers/gpu/drm/amd/display/dc/dio/dcn10/dcn10_stream_encoder.c b/drivers/gpu/drm/amd/display/dc/dio/dcn10/dcn10_stream_encoder.c
index d01a8b8f9595..6d897b6b0ccf 100644
--- a/drivers/gpu/drm/amd/display/dc/dio/dcn10/dcn10_stream_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dio/dcn10/dcn10_stream_encoder.c
@@ -68,7 +68,7 @@ void enc1_update_generic_info_packet(
 	REG_UPDATE(AFMT_CNTL, AFMT_AUDIO_CLOCK_EN, 1);
 
 	if (packet_index >= 8)
-		ASSERT(0);
+		ASSERT_WARN(0);
 
 	/* poll dig_update_lock is not locked -> asic internal signal
 	 * assume otg master lock will unlock it
@@ -616,8 +616,8 @@ void enc1_stream_encoder_dvi_set_stream_attribute(
 			enc1->base.bp, &cntl) != BP_RESULT_OK)
 		return;
 
-	ASSERT(crtc_timing->pixel_encoding == PIXEL_ENCODING_RGB);
-	ASSERT(crtc_timing->display_color_depth == COLOR_DEPTH_888);
+	ASSERT_WARN(crtc_timing->pixel_encoding == PIXEL_ENCODING_RGB);
+	ASSERT_WARN(crtc_timing->display_color_depth == COLOR_DEPTH_888);
 	enc1_stream_encoder_set_stream_attribute_helper(enc1, crtc_timing);
 }
 
@@ -1229,7 +1229,7 @@ static void enc1_se_audio_setup(
 
 	uint32_t channels = 0;
 
-	ASSERT(audio_info);
+	ASSERT_WARN(audio_info);
 	if (audio_info == NULL)
 		/* This should not happen.it does so we don't get BSOD*/
 		return;
diff --git a/drivers/gpu/drm/amd/display/dc/dio/dcn20/dcn20_stream_encoder.c b/drivers/gpu/drm/amd/display/dc/dio/dcn20/dcn20_stream_encoder.c
index 0b47aeb60e79..ba34dc0f1865 100644
--- a/drivers/gpu/drm/amd/display/dc/dio/dcn20/dcn20_stream_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dio/dcn20/dcn20_stream_encoder.c
@@ -222,7 +222,7 @@ static void enc2_update_gsp7_128_info_packet(
 	uint32_t max_retries = 50;
 	const uint32_t *content = (const uint32_t *) &info_packet->sb[0];
 
-	ASSERT(info_packet->hb1  == DC_DP_INFOFRAME_TYPE_PPS);
+	ASSERT_WARN(info_packet->hb1  == DC_DP_INFOFRAME_TYPE_PPS);
 
 	/* Configure for PPS packet size (128 bytes) */
 	REG_UPDATE(DP_SEC_CNTL2, DP_SEC_GSP7_PPS, 1);
@@ -303,7 +303,7 @@ static void enc2_dp_set_dsc_pps_info_packet(struct stream_encoder *enc,
 	if (enable) {
 		struct dc_info_packet_128 pps_sdp;
 
-		ASSERT(dsc_packed_pps);
+		ASSERT_WARN(dsc_packed_pps);
 
 		/* Load PPS into infoframe (SDP) registers */
 		pps_sdp.valid = true;
diff --git a/drivers/gpu/drm/amd/display/dc/dio/dcn30/dcn30_dio_stream_encoder.c b/drivers/gpu/drm/amd/display/dc/dio/dcn30/dcn30_dio_stream_encoder.c
index 425b830b88d2..e21782808a6d 100644
--- a/drivers/gpu/drm/amd/display/dc/dio/dcn30/dcn30_dio_stream_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dio/dcn30/dcn30_dio_stream_encoder.c
@@ -565,8 +565,8 @@ static void enc3_stream_encoder_dvi_set_stream_attribute(
 		udelay(1);
 	}
 
-	ASSERT(crtc_timing->pixel_encoding == PIXEL_ENCODING_RGB);
-	ASSERT(crtc_timing->display_color_depth == COLOR_DEPTH_888);
+	ASSERT_WARN(crtc_timing->pixel_encoding == PIXEL_ENCODING_RGB);
+	ASSERT_WARN(crtc_timing->display_color_depth == COLOR_DEPTH_888);
 	enc1_stream_encoder_set_stream_attribute_helper(enc1, crtc_timing);
 }
 
@@ -696,7 +696,7 @@ static void enc3_stream_encoder_hdmi_set_stream_attribute(
 	REG_UPDATE(HDMI_INFOFRAME_CONTROL0, HDMI_AUDIO_INFO_SEND, 1);
 
 	/* update double-buffered AUDIO_INFO registers immediately */
-	ASSERT (enc->afmt);
+	ASSERT_WARN (enc->afmt);
 	enc->afmt->funcs->audio_info_immediate_update(enc->afmt);
 
 	/* Select line number on which to send Audio InfoFrame packets */
@@ -711,7 +711,7 @@ void enc3_audio_mute_control(
 	struct stream_encoder *enc,
 	bool mute)
 {
-	ASSERT (enc->afmt);
+	ASSERT_WARN (enc->afmt);
 	enc->afmt->funcs->audio_mute_control(enc->afmt, mute);
 }
 
@@ -720,7 +720,7 @@ void enc3_se_dp_audio_setup(
 	unsigned int az_inst,
 	struct audio_info *info)
 {
-	ASSERT (enc->afmt);
+	ASSERT_WARN (enc->afmt);
 	enc->afmt->funcs->se_audio_setup(enc->afmt, az_inst, info);
 }
 
@@ -742,7 +742,7 @@ static void enc3_se_setup_dp_audio(
 	REG_SET(DP_SEC_TIMESTAMP, 0, DP_SEC_TIMESTAMP_MODE,
 			DP_SEC_TIMESTAMP__DP_SEC_TIMESTAMP_MODE__AUTO_CALC);
 
-	ASSERT (enc->afmt);
+	ASSERT_WARN (enc->afmt);
 	enc->afmt->funcs->setup_dp_audio(enc->afmt);
 }
 
@@ -763,7 +763,7 @@ static void enc3_se_setup_hdmi_audio(
 	struct audio_clock_info audio_clock_info = {0};
 
 	/* Setup audio in AFMT - program AFMT block associated with DIO */
-	ASSERT (enc->afmt);
+	ASSERT_WARN (enc->afmt);
 	enc->afmt->funcs->setup_hdmi_audio(enc->afmt);
 
 	/* HDMI_AUDIO_PACKET_CONTROL */
@@ -820,7 +820,7 @@ void enc3_se_hdmi_audio_setup(
 {
 	enc1_se_enable_audio_clock(enc, true);
 	enc3_se_setup_hdmi_audio(enc, audio_crtc_info);
-	ASSERT (enc->afmt);
+	ASSERT_WARN (enc->afmt);
 	enc->afmt->funcs->se_audio_setup(enc->afmt, az_inst, info);
 }
 
diff --git a/drivers/gpu/drm/amd/display/dc/dio/dcn314/dcn314_dio_stream_encoder.c b/drivers/gpu/drm/amd/display/dc/dio/dcn314/dcn314_dio_stream_encoder.c
index ae81451a3a72..76f66817dd36 100644
--- a/drivers/gpu/drm/amd/display/dc/dio/dcn314/dcn314_dio_stream_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dio/dcn314/dcn314_dio_stream_encoder.c
@@ -136,8 +136,8 @@ void enc314_stream_encoder_dvi_set_stream_attribute(
 		enc314_enable_fifo(enc);
 	}
 
-	ASSERT(crtc_timing->pixel_encoding == PIXEL_ENCODING_RGB);
-	ASSERT(crtc_timing->display_color_depth == COLOR_DEPTH_888);
+	ASSERT_WARN(crtc_timing->pixel_encoding == PIXEL_ENCODING_RGB);
+	ASSERT_WARN(crtc_timing->display_color_depth == COLOR_DEPTH_888);
 	enc1_stream_encoder_set_stream_attribute_helper(enc1, crtc_timing);
 }
 
@@ -261,7 +261,7 @@ void enc314_stream_encoder_hdmi_set_stream_attribute(
 	REG_UPDATE(HDMI_INFOFRAME_CONTROL0, HDMI_AUDIO_INFO_SEND, 1);
 
 	/* update double-buffered AUDIO_INFO registers immediately */
-	ASSERT(enc->afmt);
+	ASSERT_WARN(enc->afmt);
 	enc->afmt->funcs->audio_info_immediate_update(enc->afmt);
 
 	/* Select line number on which to send Audio InfoFrame packets */
diff --git a/drivers/gpu/drm/amd/display/dc/dio/dcn32/dcn32_dio_stream_encoder.c b/drivers/gpu/drm/amd/display/dc/dio/dcn32/dcn32_dio_stream_encoder.c
index 1a9bb614c41e..9af7b7252d3c 100644
--- a/drivers/gpu/drm/amd/display/dc/dio/dcn32/dcn32_dio_stream_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dio/dcn32/dcn32_dio_stream_encoder.c
@@ -94,8 +94,8 @@ static void enc32_stream_encoder_dvi_set_stream_attribute(
 		/* DIG_START is removed from the register spec */
 	}
 
-	ASSERT(crtc_timing->pixel_encoding == PIXEL_ENCODING_RGB);
-	ASSERT(crtc_timing->display_color_depth == COLOR_DEPTH_888);
+	ASSERT_WARN(crtc_timing->pixel_encoding == PIXEL_ENCODING_RGB);
+	ASSERT_WARN(crtc_timing->display_color_depth == COLOR_DEPTH_888);
 	enc1_stream_encoder_set_stream_attribute_helper(enc1, crtc_timing);
 }
 
@@ -219,7 +219,7 @@ static void enc32_stream_encoder_hdmi_set_stream_attribute(
 	REG_UPDATE(HDMI_INFOFRAME_CONTROL0, HDMI_AUDIO_INFO_SEND, 1);
 
 	/* update double-buffered AUDIO_INFO registers immediately */
-	ASSERT(enc->afmt);
+	ASSERT_WARN(enc->afmt);
 	enc->afmt->funcs->audio_info_immediate_update(enc->afmt);
 
 	/* Select line number on which to send Audio InfoFrame packets */
diff --git a/drivers/gpu/drm/amd/display/dc/dio/dcn35/dcn35_dio_stream_encoder.c b/drivers/gpu/drm/amd/display/dc/dio/dcn35/dcn35_dio_stream_encoder.c
index 6ab2a218b769..bb14e9e90818 100644
--- a/drivers/gpu/drm/amd/display/dc/dio/dcn35/dcn35_dio_stream_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dio/dcn35/dcn35_dio_stream_encoder.c
@@ -82,8 +82,8 @@ static void enc35_stream_encoder_dvi_set_stream_attribute(
 		/* DIG_START is removed from the register spec */
 	}
 
-	ASSERT(crtc_timing->pixel_encoding == PIXEL_ENCODING_RGB);
-	ASSERT(crtc_timing->display_color_depth == COLOR_DEPTH_888);
+	ASSERT_WARN(crtc_timing->pixel_encoding == PIXEL_ENCODING_RGB);
+	ASSERT_WARN(crtc_timing->display_color_depth == COLOR_DEPTH_888);
 	enc1_stream_encoder_set_stream_attribute_helper(enc1, crtc_timing);
 }
 /* setup stream encoder in hdmi mode */
@@ -207,7 +207,7 @@ static void enc35_stream_encoder_hdmi_set_stream_attribute(
 	REG_UPDATE(HDMI_INFOFRAME_CONTROL0, HDMI_AUDIO_INFO_SEND, 1);
 
 	/* update double-buffered AUDIO_INFO registers immediately */
-	ASSERT(enc->afmt);
+	ASSERT_WARN(enc->afmt);
 	enc->afmt->funcs->audio_info_immediate_update(enc->afmt);
 
 	/* Select line number on which to send Audio InfoFrame packets */
@@ -371,7 +371,7 @@ static void enc35_stream_encoder_map_to_link(
 {
 	struct dcn10_stream_encoder *enc1 = DCN10STRENC_FROM_STRENC(enc);
 
-	ASSERT(stream_enc_inst < 5 && link_enc_inst < 5);
+	ASSERT_WARN(stream_enc_inst < 5 && link_enc_inst < 5);
 	REG_UPDATE(STREAM_MAPPER_CONTROL,
 				DIG_STREAM_LINK_TARGET, link_enc_inst);
 }
diff --git a/drivers/gpu/drm/amd/display/dc/dio/dcn401/dcn401_dio_stream_encoder.c b/drivers/gpu/drm/amd/display/dc/dio/dcn401/dcn401_dio_stream_encoder.c
index 098c2a01a850..b55604f29438 100644
--- a/drivers/gpu/drm/amd/display/dc/dio/dcn401/dcn401_dio_stream_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dio/dcn401/dcn401_dio_stream_encoder.c
@@ -94,8 +94,8 @@ static void enc401_stream_encoder_dvi_set_stream_attribute(
 		/* DIG_START is removed from the register spec */
 	}
 
-	ASSERT(crtc_timing->pixel_encoding == PIXEL_ENCODING_RGB);
-	ASSERT(crtc_timing->display_color_depth == COLOR_DEPTH_888);
+	ASSERT_WARN(crtc_timing->pixel_encoding == PIXEL_ENCODING_RGB);
+	ASSERT_WARN(crtc_timing->display_color_depth == COLOR_DEPTH_888);
 	enc401_stream_encoder_set_stream_attribute_helper(enc1, crtc_timing);
 }
 
@@ -218,7 +218,7 @@ static void enc401_stream_encoder_hdmi_set_stream_attribute(
 	REG_UPDATE(HDMI_INFOFRAME_CONTROL0, HDMI_AUDIO_INFO_SEND, 1);
 
 	/* update double-buffered AUDIO_INFO registers immediately */
-	ASSERT(enc->afmt);
+	ASSERT_WARN(enc->afmt);
 	enc->afmt->funcs->audio_info_immediate_update(enc->afmt);
 
 	/* Select line number on which to send Audio InfoFrame packets */
@@ -571,7 +571,7 @@ void enc401_stream_encoder_dp_set_stream_attribute(
 			dp_translate_pixel_enc = 2;
 			break;
 		default:
-			ASSERT(0);
+			ASSERT_WARN(0);
 			break;
 		}
 	}
diff --git a/drivers/gpu/drm/amd/display/dc/dm_services.h b/drivers/gpu/drm/amd/display/dc/dm_services.h
index f81e5a4e1d6d..4b9701ac1257 100644
--- a/drivers/gpu/drm/amd/display/dc/dm_services.h
+++ b/drivers/gpu/drm/amd/display/dc/dm_services.h
@@ -105,7 +105,7 @@ static inline uint32_t set_reg_field_value_ex(
 	uint32_t mask,
 	uint8_t shift)
 {
-	ASSERT(mask != 0);
+	ASSERT_WARN(mask != 0);
 	return (reg_value & ~mask) | (mask & (value << shift));
 }
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calc_math.c b/drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calc_math.c
index cac72413a097..f21441daafa0 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calc_math.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calc_math.c
@@ -70,7 +70,7 @@ float dcn_bw_max2(const float arg1, const float arg2)
 
 float dcn_bw_floor2(const float arg, const float significance)
 {
-	ASSERT(significance != 0);
+	ASSERT_WARN(significance != 0);
 
 	return ((int) (arg / significance)) * significance;
 }
@@ -86,7 +86,7 @@ float dcn_bw_ceil(const float arg)
 
 float dcn_bw_ceil2(const float arg, const float significance)
 {
-	ASSERT(significance != 0);
+	ASSERT_WARN(significance != 0);
 
 	return ((int) (arg / significance + 0.99999)) * significance;
 }
@@ -104,7 +104,7 @@ float dcn_bw_max5(float v1, float v2, float v3, float v4, float v5)
 float dcn_bw_pow(float a, float exp)
 {
 	float temp;
-	/*ASSERT(exp == (int)exp);*/
+	/*ASSERT_WARN(exp == (int)exp);*/
 	if ((int)exp == 0)
 		return 1;
 	temp = dcn_bw_pow(a, (int)(exp / 2));
diff --git a/drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c b/drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c
index 39525721c976..c16414cd6b7c 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c
@@ -293,7 +293,7 @@ enum source_macro_tile_size swizzle_mode_to_macro_tile_size(enum swizzle_mode_va
 	/* Unsupported swizzle modes for dcn */
 	case DC_SW_256B_S:
 	default:
-		ASSERT(0); /* Not supported */
+		ASSERT_WARN(0); /* Not supported */
 		return 0;
 	}
 }
@@ -357,7 +357,7 @@ static void pipe_ctx_to_e2e_pipe_params (
 		input->src.source_scan = dm_vert;
 		break;
 	default:
-		ASSERT(0); /* Not supported */
+		ASSERT_WARN(0); /* Not supported */
 		break;
 	}
 
@@ -540,7 +540,7 @@ static void split_stream_across_pipes(
 	secondary_pipe->plane_res.dpp = pool->dpps[secondary_pipe->pipe_idx];
 	secondary_pipe->plane_res.mpcc_inst = pool->dpps[secondary_pipe->pipe_idx]->inst;
 	if (primary_pipe->bottom_pipe) {
-		ASSERT(primary_pipe->bottom_pipe != secondary_pipe);
+		ASSERT_WARN(primary_pipe->bottom_pipe != secondary_pipe);
 		secondary_pipe->bottom_pipe = primary_pipe->bottom_pipe;
 		secondary_pipe->bottom_pipe->top_pipe = secondary_pipe;
 	}
@@ -974,14 +974,14 @@ bool dcn_validate_bandwidth(
 			}
 
 			if (pipe->plane_state->rotation % 2 == 0) {
-				ASSERT(pipe->plane_res.scl_data.ratios.horz.value != dc_fixpt_one.value
+				ASSERT_WARN(pipe->plane_res.scl_data.ratios.horz.value != dc_fixpt_one.value
 					|| v->scaler_rec_out_width[input_idx] == v->viewport_width[input_idx]);
-				ASSERT(pipe->plane_res.scl_data.ratios.vert.value != dc_fixpt_one.value
+				ASSERT_WARN(pipe->plane_res.scl_data.ratios.vert.value != dc_fixpt_one.value
 					|| v->scaler_recout_height[input_idx] == v->viewport_height[input_idx]);
 			} else {
-				ASSERT(pipe->plane_res.scl_data.ratios.horz.value != dc_fixpt_one.value
+				ASSERT_WARN(pipe->plane_res.scl_data.ratios.horz.value != dc_fixpt_one.value
 					|| v->scaler_recout_height[input_idx] == v->viewport_width[input_idx]);
-				ASSERT(pipe->plane_res.scl_data.ratios.vert.value != dc_fixpt_one.value
+				ASSERT_WARN(pipe->plane_res.scl_data.ratios.vert.value != dc_fixpt_one.value
 					|| v->scaler_rec_out_width[input_idx] == v->viewport_height[input_idx]);
 			}
 
@@ -1259,7 +1259,7 @@ bool dcn_validate_bandwidth(
 					} else {
 						/* pipe not split previously needs split */
 						hsplit_pipe = resource_find_free_secondary_pipe_legacy(&context->res_ctx, pool, pipe);
-						ASSERT(hsplit_pipe);
+						ASSERT_WARN(hsplit_pipe);
 						split_stream_across_pipes(&context->res_ctx, pool, pipe, hsplit_pipe);
 					}
 
@@ -1450,7 +1450,7 @@ void dcn_bw_update_from_pplib_fclks(
 {
 	unsigned vmin0p65_idx, vmid0p72_idx, vnom0p8_idx, vmax0p9_idx;
 
-	ASSERT(fclks->num_levels);
+	ASSERT_WARN(fclks->num_levels);
 
 	vmin0p65_idx = 0;
 	vmid0p72_idx = fclks->num_levels > 2 ? fclks->num_levels - 3 : 0;
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn10/dcn10_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn10/dcn10_fpu.c
index c5e84190c17a..0cc9a68fdaa3 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn10/dcn10_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn10/dcn10_fpu.c
@@ -144,7 +144,7 @@ void dcn10_resource_construct_fp(struct dc *dc)
 	}
 
 	dc->dcn_soc->number_of_channels = dc->ctx->asic_id.vram_width / ddr4_dram_width;
-	ASSERT(dc->dcn_soc->number_of_channels < 3);
+	ASSERT_WARN(dc->dcn_soc->number_of_channels < 3);
 	if (dc->dcn_soc->number_of_channels == 0)/*old sbios bug*/
 		dc->dcn_soc->number_of_channels = 2;
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
index e9fea9c2162e..504c9a27b471 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
@@ -1307,7 +1307,7 @@ static void swizzle_to_dml_params(
 		*sw_mode = dm_sw_var_r_x;
 		break;
 	default:
-		ASSERT(0); /* Not supported */
+		ASSERT_WARN(0); /* Not supported */
 		break;
 	}
 }
@@ -2093,7 +2093,7 @@ bool dcn20_validate_bandwidth_fp(struct dc *dc, struct dc_state *context,
 		dc->debug.enable_dram_clock_change_one_display_vactive;
 
 	/*Unsafe due to current pipe merge and split logic*/
-	ASSERT(context != dc->current_state);
+	ASSERT_WARN(context != dc->current_state);
 
 	if (fast_validate) {
 		return dcn20_validate_bandwidth_internal(dc, context, true, pipes);
@@ -2122,7 +2122,7 @@ bool dcn20_validate_bandwidth_fp(struct dc *dc, struct dc_state *context,
 	}
 
 	// ERROR: fallback is supposed to always work.
-	ASSERT(false);
+	ASSERT_WARN(false);
 
 restore_dml_state:
 	context->bw_ctx.dml.soc.dram_clock_change_latency_us = p_state_latency_us;
@@ -2213,7 +2213,7 @@ static void calculate_wm_set_for_vlevel(int vlevel,
 {
 	double dram_clock_change_latency_cached = dml->soc.dram_clock_change_latency_us;
 
-	ASSERT(vlevel < dml->soc.num_states);
+	ASSERT_WARN(vlevel < dml->soc.num_states);
 	/* only pipe 0 is read for voltage and dcf/soc clocks */
 	pipes[0].clks_cfg.voltage = vlevel;
 	pipes[0].clks_cfg.dcfclk_mhz = dml->soc.clock_limits[vlevel].dcfclk_mhz;
@@ -2246,7 +2246,7 @@ static void dcn21_calculate_wm(struct dc *dc, struct dc_state *context,
 	struct wm_range_table_entry *table_entry;
 	struct clk_bw_params *bw_params = dc->clk_mgr->bw_params;
 
-	ASSERT(bw_params);
+	ASSERT_WARN(bw_params);
 
 	patch_bounding_box(dc, &context->bw_ctx.dml.soc);
 
@@ -2335,7 +2335,7 @@ bool dcn21_validate_bandwidth_fp(struct dc *dc, struct dc_state *context,
 	dc_assert_fp_enabled();
 
 	/*Unsafe due to current pipe merge and split logic*/
-	ASSERT(context != dc->current_state);
+	ASSERT_WARN(context != dc->current_state);
 
 	out = dcn21_fast_validate_bw(dc, context, pipes, &pipe_cnt, pipe_split_from, &vlevel, fast_validate);
 
@@ -2414,7 +2414,7 @@ void dcn21_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_params
 	dcn2_1_ip.max_num_dpp = pool->base.pipe_count;
 	dcn2_1_soc.num_chans = bw_params->num_channels;
 
-	ASSERT(clk_table->num_entries);
+	ASSERT_WARN(clk_table->num_entries);
 	/* Copy dcn2_1_soc.clock_limits to clock_limits to avoid copying over null states later */
 	memcpy(s, dcn2_1_soc.clock_limits, sizeof(dcn2_1_soc.clock_limits));
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
index 0c8c4a080c50..ce66462b3b9c 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
@@ -1246,7 +1246,7 @@ static void dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPer
 			mode_lib->vba.DISPCLKWithoutRamping,
 			mode_lib->vba.WritebackDISPCLK);
 
-	ASSERT(mode_lib->vba.DISPCLKDPPCLKVCOSpeed != 0);
+	ASSERT_WARN(mode_lib->vba.DISPCLKDPPCLKVCOSpeed != 0);
 	mode_lib->vba.DISPCLKWithRampingRoundedToDFSGranularity = RoundToDFSGranularityUp(
 			mode_lib->vba.DISPCLKWithRamping,
 			mode_lib->vba.DISPCLKDPPCLKVCOSpeed);
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c
index c935903b68e1..0f14e7a7600d 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c
@@ -1306,7 +1306,7 @@ static void dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndP
 			mode_lib->vba.DISPCLKWithoutRamping,
 			mode_lib->vba.WritebackDISPCLK);
 
-	ASSERT(mode_lib->vba.DISPCLKDPPCLKVCOSpeed != 0);
+	ASSERT_WARN(mode_lib->vba.DISPCLKDPPCLKVCOSpeed != 0);
 	mode_lib->vba.DISPCLKWithRampingRoundedToDFSGranularity = RoundToDFSGranularityUp(
 			mode_lib->vba.DISPCLKWithRamping,
 			mode_lib->vba.DISPCLKDPPCLKVCOSpeed);
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.c
index 390c1a77fda6..94ef714cc066 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.c
@@ -607,7 +607,7 @@ static void get_meta_and_pte_attr(struct display_mode_lib *mode_lib,
 								/ data_pitch),
 				1);
 
-		ASSERT(log2_dpte_row_height_linear >= 3);
+		ASSERT_WARN(log2_dpte_row_height_linear >= 3);
 
 		if (log2_dpte_row_height_linear > 7)
 			log2_dpte_row_height_linear = 7;
@@ -915,7 +915,7 @@ static void dml20_rq_dlg_get_dlg_params(struct display_mode_lib *mode_lib,
 	dml_print("DML_DLG: %s: refclk_freq_in_mhz     = %3.2f\n", __func__, refclk_freq_in_mhz);
 	dml_print("DML_DLG: %s: pclk_freq_in_mhz       = %3.2f\n", __func__, pclk_freq_in_mhz);
 	dml_print("DML_DLG: %s: interlaced             = %d\n", __func__, interlaced);
-	ASSERT(ref_freq_to_pix_freq < 4.0);
+	ASSERT_WARN(ref_freq_to_pix_freq < 4.0);
 
 	disp_dlg_regs->ref_freq_to_pix_freq =
 			(unsigned int) (ref_freq_to_pix_freq * dml_pow(2, 19));
@@ -924,7 +924,7 @@ static void dml20_rq_dlg_get_dlg_params(struct display_mode_lib *mode_lib,
 	disp_dlg_regs->dlg_vblank_end = interlaced ? (vblank_end / 2) : vblank_end; // 15 bits
 	disp_dlg_regs->refcyc_h_blank_end = (unsigned int) ((double) hblank_end
 			* (double) ref_freq_to_pix_freq);
-	ASSERT(disp_dlg_regs->refcyc_h_blank_end < (unsigned int) dml_pow(2, 13));
+	ASSERT_WARN(disp_dlg_regs->refcyc_h_blank_end < (unsigned int) dml_pow(2, 13));
 
 	min_dcfclk_mhz = dlg_sys_param->deepsleep_dcfclk_mhz;
 	t_calc_us = get_tcalc(mode_lib, e2e_pipe_param, num_pipes);
@@ -934,7 +934,7 @@ static void dml20_rq_dlg_get_dlg_params(struct display_mode_lib *mode_lib,
 	dlg_vblank_start = interlaced ? (vblank_start / 2) : vblank_start;
 
 	disp_dlg_regs->min_dst_y_next_start = (unsigned int) ((double) dlg_vblank_start * dml_pow(2, 2));
-	ASSERT(disp_dlg_regs->min_dst_y_next_start < (unsigned int) dml_pow(2, 18));
+	ASSERT_WARN(disp_dlg_regs->min_dst_y_next_start < (unsigned int) dml_pow(2, 18));
 
 	dml_print("DML_DLG: %s: min_dcfclk_mhz                         = %3.2f\n",
 			__func__,
@@ -1112,10 +1112,10 @@ static void dml20_rq_dlg_get_dlg_params(struct display_mode_lib *mode_lib,
 	dml_print("DML_DLG: %s: dst_y_per_vm_vblank    = %3.2f\n", __func__, dst_y_per_vm_vblank);
 	dml_print("DML_DLG: %s: dst_y_per_row_vblank   = %3.2f\n", __func__, dst_y_per_row_vblank);
 
-	ASSERT(dst_y_per_vm_vblank < min_dst_y_per_vm_vblank);
-	ASSERT(dst_y_per_row_vblank < min_dst_y_per_row_vblank);
+	ASSERT_WARN(dst_y_per_vm_vblank < min_dst_y_per_vm_vblank);
+	ASSERT_WARN(dst_y_per_row_vblank < min_dst_y_per_row_vblank);
 
-	ASSERT(dst_y_prefetch > (dst_y_per_vm_vblank + dst_y_per_row_vblank));
+	ASSERT_WARN(dst_y_prefetch > (dst_y_per_vm_vblank + dst_y_per_row_vblank));
 	lsw = dst_y_prefetch - (dst_y_per_vm_vblank + dst_y_per_row_vblank);
 
 	dml_print("DML_DLG: %s: lsw = %3.2f\n", __func__, lsw);
@@ -1301,8 +1301,8 @@ static void dml20_rq_dlg_get_dlg_params(struct display_mode_lib *mode_lib,
 			__func__,
 			refcyc_per_req_delivery_l);
 
-	ASSERT(refcyc_per_req_delivery_pre_l < dml_pow(2, 13));
-	ASSERT(refcyc_per_req_delivery_l < dml_pow(2, 13));
+	ASSERT_WARN(refcyc_per_req_delivery_pre_l < dml_pow(2, 13));
+	ASSERT_WARN(refcyc_per_req_delivery_l < dml_pow(2, 13));
 
 	if (dual_plane) {
 		refcyc_per_req_delivery_pre_c = get_refcyc_per_delivery(mode_lib,
@@ -1333,8 +1333,8 @@ static void dml20_rq_dlg_get_dlg_params(struct display_mode_lib *mode_lib,
 				__func__,
 				refcyc_per_req_delivery_c);
 
-		ASSERT(refcyc_per_req_delivery_pre_c < dml_pow(2, 13));
-		ASSERT(refcyc_per_req_delivery_c < dml_pow(2, 13));
+		ASSERT_WARN(refcyc_per_req_delivery_pre_c < dml_pow(2, 13));
+		ASSERT_WARN(refcyc_per_req_delivery_c < dml_pow(2, 13));
 	}
 
 	// TTU - Cursor
@@ -1376,7 +1376,7 @@ static void dml20_rq_dlg_get_dlg_params(struct display_mode_lib *mode_lib,
 	// Assignment to register structures
 	disp_dlg_regs->dst_y_after_scaler = dst_y_after_scaler; // in terms of line
 	disp_dlg_regs->refcyc_x_after_scaler = dst_x_after_scaler * ref_freq_to_pix_freq; // in terms of refclk
-	ASSERT(disp_dlg_regs->refcyc_x_after_scaler < (unsigned int) dml_pow(2, 13));
+	ASSERT_WARN(disp_dlg_regs->refcyc_x_after_scaler < (unsigned int) dml_pow(2, 13));
 	disp_dlg_regs->dst_y_prefetch = (unsigned int) (dst_y_prefetch * dml_pow(2, 2));
 	disp_dlg_regs->dst_y_per_vm_vblank = (unsigned int) (dst_y_per_vm_vblank * dml_pow(2, 2));
 	disp_dlg_regs->dst_y_per_row_vblank = (unsigned int) (dst_y_per_row_vblank * dml_pow(2, 2));
@@ -1389,20 +1389,20 @@ static void dml20_rq_dlg_get_dlg_params(struct display_mode_lib *mode_lib,
 	disp_dlg_regs->refcyc_per_pte_group_vblank_l =
 			(unsigned int) (dst_y_per_row_vblank * (double) htotal
 					* ref_freq_to_pix_freq / (double) dpte_groups_per_row_ub_l);
-	ASSERT(disp_dlg_regs->refcyc_per_pte_group_vblank_l < (unsigned int) dml_pow(2, 13));
+	ASSERT_WARN(disp_dlg_regs->refcyc_per_pte_group_vblank_l < (unsigned int) dml_pow(2, 13));
 
 	if (dual_plane) {
 		disp_dlg_regs->refcyc_per_pte_group_vblank_c = (unsigned int) (dst_y_per_row_vblank
 				* (double) htotal * ref_freq_to_pix_freq
 				/ (double) dpte_groups_per_row_ub_c);
-		ASSERT(disp_dlg_regs->refcyc_per_pte_group_vblank_c
+		ASSERT_WARN(disp_dlg_regs->refcyc_per_pte_group_vblank_c
 						< (unsigned int) dml_pow(2, 13));
 	}
 
 	disp_dlg_regs->refcyc_per_meta_chunk_vblank_l =
 			(unsigned int) (dst_y_per_row_vblank * (double) htotal
 					* ref_freq_to_pix_freq / (double) meta_chunks_per_row_ub_l);
-	ASSERT(disp_dlg_regs->refcyc_per_meta_chunk_vblank_l < (unsigned int) dml_pow(2, 13));
+	ASSERT_WARN(disp_dlg_regs->refcyc_per_meta_chunk_vblank_l < (unsigned int) dml_pow(2, 13));
 
 	disp_dlg_regs->refcyc_per_meta_chunk_vblank_c =
 			disp_dlg_regs->refcyc_per_meta_chunk_vblank_l; // dcc for 4:2:0 is not supported in dcn1.0.  assigned to be the same as _l for now
@@ -1421,7 +1421,7 @@ static void dml20_rq_dlg_get_dlg_params(struct display_mode_lib *mode_lib,
 
 	disp_dlg_regs->dst_y_per_pte_row_nom_l = (unsigned int) ((double) dpte_row_height_l
 			/ (double) vratio_l * dml_pow(2, 2));
-	ASSERT(disp_dlg_regs->dst_y_per_pte_row_nom_l < (unsigned int) dml_pow(2, 17));
+	ASSERT_WARN(disp_dlg_regs->dst_y_per_pte_row_nom_l < (unsigned int) dml_pow(2, 17));
 
 	if (dual_plane) {
 		disp_dlg_regs->dst_y_per_pte_row_nom_c = (unsigned int) ((double) dpte_row_height_c
@@ -1436,7 +1436,7 @@ static void dml20_rq_dlg_get_dlg_params(struct display_mode_lib *mode_lib,
 
 	disp_dlg_regs->dst_y_per_meta_row_nom_l = (unsigned int) ((double) meta_row_height_l
 			/ (double) vratio_l * dml_pow(2, 2));
-	ASSERT(disp_dlg_regs->dst_y_per_meta_row_nom_l < (unsigned int) dml_pow(2, 17));
+	ASSERT_WARN(disp_dlg_regs->dst_y_per_meta_row_nom_l < (unsigned int) dml_pow(2, 17));
 
 	disp_dlg_regs->dst_y_per_meta_row_nom_c = disp_dlg_regs->dst_y_per_meta_row_nom_l; // TODO: dcc for 4:2:0 is not supported in dcn1.0.  assigned to be the same as _l for now
 
@@ -1472,15 +1472,15 @@ static void dml20_rq_dlg_get_dlg_params(struct display_mode_lib *mode_lib,
 			1);
 	disp_dlg_regs->refcyc_per_line_delivery_l = (unsigned int) dml_floor(refcyc_per_line_delivery_l,
 			1);
-	ASSERT(disp_dlg_regs->refcyc_per_line_delivery_pre_l < (unsigned int) dml_pow(2, 13));
-	ASSERT(disp_dlg_regs->refcyc_per_line_delivery_l < (unsigned int) dml_pow(2, 13));
+	ASSERT_WARN(disp_dlg_regs->refcyc_per_line_delivery_pre_l < (unsigned int) dml_pow(2, 13));
+	ASSERT_WARN(disp_dlg_regs->refcyc_per_line_delivery_l < (unsigned int) dml_pow(2, 13));
 
 	disp_dlg_regs->refcyc_per_line_delivery_pre_c = (unsigned int) dml_floor(refcyc_per_line_delivery_pre_c,
 			1);
 	disp_dlg_regs->refcyc_per_line_delivery_c = (unsigned int) dml_floor(refcyc_per_line_delivery_c,
 			1);
-	ASSERT(disp_dlg_regs->refcyc_per_line_delivery_pre_c < (unsigned int) dml_pow(2, 13));
-	ASSERT(disp_dlg_regs->refcyc_per_line_delivery_c < (unsigned int) dml_pow(2, 13));
+	ASSERT_WARN(disp_dlg_regs->refcyc_per_line_delivery_pre_c < (unsigned int) dml_pow(2, 13));
+	ASSERT_WARN(disp_dlg_regs->refcyc_per_line_delivery_c < (unsigned int) dml_pow(2, 13));
 
 	disp_dlg_regs->chunk_hdl_adjust_cur0 = 3;
 	disp_dlg_regs->dst_y_offset_cur0 = 0;
@@ -1506,10 +1506,10 @@ static void dml20_rq_dlg_get_dlg_params(struct display_mode_lib *mode_lib,
 	disp_ttu_regs->refcyc_per_req_delivery_cur1 = (unsigned int) (refcyc_per_req_delivery_cur1
 			* dml_pow(2, 10));
 	disp_ttu_regs->qos_level_low_wm = 0;
-	ASSERT(disp_ttu_regs->qos_level_low_wm < dml_pow(2, 14));
+	ASSERT_WARN(disp_ttu_regs->qos_level_low_wm < dml_pow(2, 14));
 	disp_ttu_regs->qos_level_high_wm = (unsigned int) (4.0 * (double) htotal
 			* ref_freq_to_pix_freq);
-	/*ASSERT(disp_ttu_regs->qos_level_high_wm < dml_pow(2, 14));*/
+	/*ASSERT_WARN(disp_ttu_regs->qos_level_high_wm < dml_pow(2, 14));*/
 
 	disp_ttu_regs->qos_level_flip = 14;
 	disp_ttu_regs->qos_level_fixed_l = 8;
@@ -1520,7 +1520,7 @@ static void dml20_rq_dlg_get_dlg_params(struct display_mode_lib *mode_lib,
 	disp_ttu_regs->qos_ramp_disable_cur0 = 0;
 
 	disp_ttu_regs->min_ttu_vblank = min_ttu_vblank * refclk_freq_in_mhz;
-	ASSERT(disp_ttu_regs->min_ttu_vblank < dml_pow(2, 24));
+	ASSERT_WARN(disp_ttu_regs->min_ttu_vblank < dml_pow(2, 24));
 
 	print__ttu_regs_st(mode_lib, disp_ttu_regs);
 	print__dlg_regs_st(mode_lib, disp_dlg_regs);
@@ -1595,7 +1595,7 @@ static void calculate_ttu_cursor(struct display_mode_lib *mode_lib,
 	double cur_req_per_width = 0.0;
 	double hactive_cur = 0.0;
 
-	ASSERT(cur_src_width <= 256);
+	ASSERT_WARN(cur_src_width <= 256);
 
 	*refcyc_per_req_delivery_pre_cur = 0.0;
 	*refcyc_per_req_delivery_cur = 0.0;
@@ -1630,7 +1630,7 @@ static void calculate_ttu_cursor(struct display_mode_lib *mode_lib,
 					/ (double) cur_req_per_width;
 		}
 
-		ASSERT(*refcyc_per_req_delivery_pre_cur < dml_pow(2, 13));
+		ASSERT_WARN(*refcyc_per_req_delivery_pre_cur < dml_pow(2, 13));
 
 		if (vratio_l <= 1.0) {
 			*refcyc_per_req_delivery_cur = hactive_cur * ref_freq_to_pix_freq
@@ -1660,6 +1660,6 @@ static void calculate_ttu_cursor(struct display_mode_lib *mode_lib,
 				__func__,
 				*refcyc_per_req_delivery_cur);
 
-		ASSERT(*refcyc_per_req_delivery_cur < dml_pow(2, 13));
+		ASSERT_WARN(*refcyc_per_req_delivery_cur < dml_pow(2, 13));
 	}
 }
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c
index 843d6004258c..a9031f8056b4 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c
@@ -607,7 +607,7 @@ static void get_meta_and_pte_attr(struct display_mode_lib *mode_lib,
 								/ data_pitch),
 				1);
 
-		ASSERT(log2_dpte_row_height_linear >= 3);
+		ASSERT_WARN(log2_dpte_row_height_linear >= 3);
 
 		if (log2_dpte_row_height_linear > 7)
 			log2_dpte_row_height_linear = 7;
@@ -915,7 +915,7 @@ static void dml20v2_rq_dlg_get_dlg_params(struct display_mode_lib *mode_lib,
 	dml_print("DML_DLG: %s: refclk_freq_in_mhz     = %3.2f\n", __func__, refclk_freq_in_mhz);
 	dml_print("DML_DLG: %s: pclk_freq_in_mhz       = %3.2f\n", __func__, pclk_freq_in_mhz);
 	dml_print("DML_DLG: %s: interlaced             = %d\n", __func__, interlaced);
-	ASSERT(ref_freq_to_pix_freq < 4.0);
+	ASSERT_WARN(ref_freq_to_pix_freq < 4.0);
 
 	disp_dlg_regs->ref_freq_to_pix_freq =
 			(unsigned int) (ref_freq_to_pix_freq * dml_pow(2, 19));
@@ -924,7 +924,7 @@ static void dml20v2_rq_dlg_get_dlg_params(struct display_mode_lib *mode_lib,
 	disp_dlg_regs->dlg_vblank_end = interlaced ? (vblank_end / 2) : vblank_end; // 15 bits
 	disp_dlg_regs->refcyc_h_blank_end = (unsigned int) ((double) hblank_end
 			* (double) ref_freq_to_pix_freq);
-	ASSERT(disp_dlg_regs->refcyc_h_blank_end < (unsigned int) dml_pow(2, 13));
+	ASSERT_WARN(disp_dlg_regs->refcyc_h_blank_end < (unsigned int) dml_pow(2, 13));
 
 	min_dcfclk_mhz = dlg_sys_param->deepsleep_dcfclk_mhz;
 	t_calc_us = get_tcalc(mode_lib, e2e_pipe_param, num_pipes);
@@ -935,7 +935,7 @@ static void dml20v2_rq_dlg_get_dlg_params(struct display_mode_lib *mode_lib,
 
 	disp_dlg_regs->min_dst_y_next_start = (unsigned int) (((double) dlg_vblank_start
 			+ min_dst_y_ttu_vblank) * dml_pow(2, 2));
-	ASSERT(disp_dlg_regs->min_dst_y_next_start < (unsigned int) dml_pow(2, 18));
+	ASSERT_WARN(disp_dlg_regs->min_dst_y_next_start < (unsigned int) dml_pow(2, 18));
 
 	dml_print("DML_DLG: %s: min_dcfclk_mhz                         = %3.2f\n",
 			__func__,
@@ -1113,10 +1113,10 @@ static void dml20v2_rq_dlg_get_dlg_params(struct display_mode_lib *mode_lib,
 	dml_print("DML_DLG: %s: dst_y_per_vm_vblank    = %3.2f\n", __func__, dst_y_per_vm_vblank);
 	dml_print("DML_DLG: %s: dst_y_per_row_vblank   = %3.2f\n", __func__, dst_y_per_row_vblank);
 
-	ASSERT(dst_y_per_vm_vblank < min_dst_y_per_vm_vblank);
-	ASSERT(dst_y_per_row_vblank < min_dst_y_per_row_vblank);
+	ASSERT_WARN(dst_y_per_vm_vblank < min_dst_y_per_vm_vblank);
+	ASSERT_WARN(dst_y_per_row_vblank < min_dst_y_per_row_vblank);
 
-	ASSERT(dst_y_prefetch > (dst_y_per_vm_vblank + dst_y_per_row_vblank));
+	ASSERT_WARN(dst_y_prefetch > (dst_y_per_vm_vblank + dst_y_per_row_vblank));
 	lsw = dst_y_prefetch - (dst_y_per_vm_vblank + dst_y_per_row_vblank);
 
 	dml_print("DML_DLG: %s: lsw = %3.2f\n", __func__, lsw);
@@ -1302,8 +1302,8 @@ static void dml20v2_rq_dlg_get_dlg_params(struct display_mode_lib *mode_lib,
 			__func__,
 			refcyc_per_req_delivery_l);
 
-	ASSERT(refcyc_per_req_delivery_pre_l < dml_pow(2, 13));
-	ASSERT(refcyc_per_req_delivery_l < dml_pow(2, 13));
+	ASSERT_WARN(refcyc_per_req_delivery_pre_l < dml_pow(2, 13));
+	ASSERT_WARN(refcyc_per_req_delivery_l < dml_pow(2, 13));
 
 	if (dual_plane) {
 		refcyc_per_req_delivery_pre_c = get_refcyc_per_delivery(mode_lib,
@@ -1334,8 +1334,8 @@ static void dml20v2_rq_dlg_get_dlg_params(struct display_mode_lib *mode_lib,
 				__func__,
 				refcyc_per_req_delivery_c);
 
-		ASSERT(refcyc_per_req_delivery_pre_c < dml_pow(2, 13));
-		ASSERT(refcyc_per_req_delivery_c < dml_pow(2, 13));
+		ASSERT_WARN(refcyc_per_req_delivery_pre_c < dml_pow(2, 13));
+		ASSERT_WARN(refcyc_per_req_delivery_c < dml_pow(2, 13));
 	}
 
 	// TTU - Cursor
@@ -1377,7 +1377,7 @@ static void dml20v2_rq_dlg_get_dlg_params(struct display_mode_lib *mode_lib,
 	// Assignment to register structures
 	disp_dlg_regs->dst_y_after_scaler = dst_y_after_scaler; // in terms of line
 	disp_dlg_regs->refcyc_x_after_scaler = dst_x_after_scaler * ref_freq_to_pix_freq; // in terms of refclk
-	ASSERT(disp_dlg_regs->refcyc_x_after_scaler < (unsigned int) dml_pow(2, 13));
+	ASSERT_WARN(disp_dlg_regs->refcyc_x_after_scaler < (unsigned int) dml_pow(2, 13));
 	disp_dlg_regs->dst_y_prefetch = (unsigned int) (dst_y_prefetch * dml_pow(2, 2));
 	disp_dlg_regs->dst_y_per_vm_vblank = (unsigned int) (dst_y_per_vm_vblank * dml_pow(2, 2));
 	disp_dlg_regs->dst_y_per_row_vblank = (unsigned int) (dst_y_per_row_vblank * dml_pow(2, 2));
@@ -1390,20 +1390,20 @@ static void dml20v2_rq_dlg_get_dlg_params(struct display_mode_lib *mode_lib,
 	disp_dlg_regs->refcyc_per_pte_group_vblank_l =
 			(unsigned int) (dst_y_per_row_vblank * (double) htotal
 					* ref_freq_to_pix_freq / (double) dpte_groups_per_row_ub_l);
-	ASSERT(disp_dlg_regs->refcyc_per_pte_group_vblank_l < (unsigned int) dml_pow(2, 13));
+	ASSERT_WARN(disp_dlg_regs->refcyc_per_pte_group_vblank_l < (unsigned int) dml_pow(2, 13));
 
 	if (dual_plane) {
 		disp_dlg_regs->refcyc_per_pte_group_vblank_c = (unsigned int) (dst_y_per_row_vblank
 				* (double) htotal * ref_freq_to_pix_freq
 				/ (double) dpte_groups_per_row_ub_c);
-		ASSERT(disp_dlg_regs->refcyc_per_pte_group_vblank_c
+		ASSERT_WARN(disp_dlg_regs->refcyc_per_pte_group_vblank_c
 						< (unsigned int) dml_pow(2, 13));
 	}
 
 	disp_dlg_regs->refcyc_per_meta_chunk_vblank_l =
 			(unsigned int) (dst_y_per_row_vblank * (double) htotal
 					* ref_freq_to_pix_freq / (double) meta_chunks_per_row_ub_l);
-	ASSERT(disp_dlg_regs->refcyc_per_meta_chunk_vblank_l < (unsigned int) dml_pow(2, 13));
+	ASSERT_WARN(disp_dlg_regs->refcyc_per_meta_chunk_vblank_l < (unsigned int) dml_pow(2, 13));
 
 	disp_dlg_regs->refcyc_per_meta_chunk_vblank_c =
 			disp_dlg_regs->refcyc_per_meta_chunk_vblank_l; // dcc for 4:2:0 is not supported in dcn1.0.  assigned to be the same as _l for now
@@ -1422,7 +1422,7 @@ static void dml20v2_rq_dlg_get_dlg_params(struct display_mode_lib *mode_lib,
 
 	disp_dlg_regs->dst_y_per_pte_row_nom_l = (unsigned int) ((double) dpte_row_height_l
 			/ (double) vratio_l * dml_pow(2, 2));
-	ASSERT(disp_dlg_regs->dst_y_per_pte_row_nom_l < (unsigned int) dml_pow(2, 17));
+	ASSERT_WARN(disp_dlg_regs->dst_y_per_pte_row_nom_l < (unsigned int) dml_pow(2, 17));
 
 	if (dual_plane) {
 		disp_dlg_regs->dst_y_per_pte_row_nom_c = (unsigned int) ((double) dpte_row_height_c
@@ -1437,7 +1437,7 @@ static void dml20v2_rq_dlg_get_dlg_params(struct display_mode_lib *mode_lib,
 
 	disp_dlg_regs->dst_y_per_meta_row_nom_l = (unsigned int) ((double) meta_row_height_l
 			/ (double) vratio_l * dml_pow(2, 2));
-	ASSERT(disp_dlg_regs->dst_y_per_meta_row_nom_l < (unsigned int) dml_pow(2, 17));
+	ASSERT_WARN(disp_dlg_regs->dst_y_per_meta_row_nom_l < (unsigned int) dml_pow(2, 17));
 
 	disp_dlg_regs->dst_y_per_meta_row_nom_c = disp_dlg_regs->dst_y_per_meta_row_nom_l; // TODO: dcc for 4:2:0 is not supported in dcn1.0.  assigned to be the same as _l for now
 
@@ -1473,15 +1473,15 @@ static void dml20v2_rq_dlg_get_dlg_params(struct display_mode_lib *mode_lib,
 			1);
 	disp_dlg_regs->refcyc_per_line_delivery_l = (unsigned int) dml_floor(refcyc_per_line_delivery_l,
 			1);
-	ASSERT(disp_dlg_regs->refcyc_per_line_delivery_pre_l < (unsigned int) dml_pow(2, 13));
-	ASSERT(disp_dlg_regs->refcyc_per_line_delivery_l < (unsigned int) dml_pow(2, 13));
+	ASSERT_WARN(disp_dlg_regs->refcyc_per_line_delivery_pre_l < (unsigned int) dml_pow(2, 13));
+	ASSERT_WARN(disp_dlg_regs->refcyc_per_line_delivery_l < (unsigned int) dml_pow(2, 13));
 
 	disp_dlg_regs->refcyc_per_line_delivery_pre_c = (unsigned int) dml_floor(refcyc_per_line_delivery_pre_c,
 			1);
 	disp_dlg_regs->refcyc_per_line_delivery_c = (unsigned int) dml_floor(refcyc_per_line_delivery_c,
 			1);
-	ASSERT(disp_dlg_regs->refcyc_per_line_delivery_pre_c < (unsigned int) dml_pow(2, 13));
-	ASSERT(disp_dlg_regs->refcyc_per_line_delivery_c < (unsigned int) dml_pow(2, 13));
+	ASSERT_WARN(disp_dlg_regs->refcyc_per_line_delivery_pre_c < (unsigned int) dml_pow(2, 13));
+	ASSERT_WARN(disp_dlg_regs->refcyc_per_line_delivery_c < (unsigned int) dml_pow(2, 13));
 
 	disp_dlg_regs->chunk_hdl_adjust_cur0 = 3;
 	disp_dlg_regs->dst_y_offset_cur0 = 0;
@@ -1507,10 +1507,10 @@ static void dml20v2_rq_dlg_get_dlg_params(struct display_mode_lib *mode_lib,
 	disp_ttu_regs->refcyc_per_req_delivery_cur1 = (unsigned int) (refcyc_per_req_delivery_cur1
 			* dml_pow(2, 10));
 	disp_ttu_regs->qos_level_low_wm = 0;
-	ASSERT(disp_ttu_regs->qos_level_low_wm < dml_pow(2, 14));
+	ASSERT_WARN(disp_ttu_regs->qos_level_low_wm < dml_pow(2, 14));
 	disp_ttu_regs->qos_level_high_wm = (unsigned int) (4.0 * (double) htotal
 			* ref_freq_to_pix_freq);
-	/*ASSERT(disp_ttu_regs->qos_level_high_wm < dml_pow(2, 14));*/
+	/*ASSERT_WARN(disp_ttu_regs->qos_level_high_wm < dml_pow(2, 14));*/
 
 	disp_ttu_regs->qos_level_flip = 14;
 	disp_ttu_regs->qos_level_fixed_l = 8;
@@ -1521,7 +1521,7 @@ static void dml20v2_rq_dlg_get_dlg_params(struct display_mode_lib *mode_lib,
 	disp_ttu_regs->qos_ramp_disable_cur0 = 0;
 
 	disp_ttu_regs->min_ttu_vblank = min_ttu_vblank * refclk_freq_in_mhz;
-	ASSERT(disp_ttu_regs->min_ttu_vblank < dml_pow(2, 24));
+	ASSERT_WARN(disp_ttu_regs->min_ttu_vblank < dml_pow(2, 24));
 
 	print__ttu_regs_st(mode_lib, disp_ttu_regs);
 	print__dlg_regs_st(mode_lib, disp_dlg_regs);
@@ -1596,7 +1596,7 @@ static void calculate_ttu_cursor(struct display_mode_lib *mode_lib,
 	double cur_req_per_width = 0.0;
 	double hactive_cur = 0.0;
 
-	ASSERT(cur_src_width <= 256);
+	ASSERT_WARN(cur_src_width <= 256);
 
 	*refcyc_per_req_delivery_pre_cur = 0.0;
 	*refcyc_per_req_delivery_cur = 0.0;
@@ -1631,7 +1631,7 @@ static void calculate_ttu_cursor(struct display_mode_lib *mode_lib,
 					/ (double) cur_req_per_width;
 		}
 
-		ASSERT(*refcyc_per_req_delivery_pre_cur < dml_pow(2, 13));
+		ASSERT_WARN(*refcyc_per_req_delivery_pre_cur < dml_pow(2, 13));
 
 		if (vratio_l <= 1.0) {
 			*refcyc_per_req_delivery_cur = hactive_cur * ref_freq_to_pix_freq
@@ -1661,6 +1661,6 @@ static void calculate_ttu_cursor(struct display_mode_lib *mode_lib,
 				__func__,
 				*refcyc_per_req_delivery_cur);
 
-		ASSERT(*refcyc_per_req_delivery_cur < dml_pow(2, 13));
+		ASSERT_WARN(*refcyc_per_req_delivery_cur < dml_pow(2, 13));
 	}
 }
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
index cd8cca651419..d4c7abfaae4f 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
@@ -1630,7 +1630,7 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 			mode_lib->vba.DISPCLKWithoutRamping,
 			mode_lib->vba.WritebackDISPCLK);
 
-	ASSERT(mode_lib->vba.DISPCLKDPPCLKVCOSpeed != 0);
+	ASSERT_WARN(mode_lib->vba.DISPCLKDPPCLKVCOSpeed != 0);
 	mode_lib->vba.DISPCLKWithRampingRoundedToDFSGranularity = RoundToDFSGranularityUp(
 			mode_lib->vba.DISPCLKWithRamping,
 			mode_lib->vba.DISPCLKDPPCLKVCOSpeed);
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_rq_dlg_calc_21.c b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_rq_dlg_calc_21.c
index 5718000627b0..40e0ef36fcb8 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_rq_dlg_calc_21.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_rq_dlg_calc_21.c
@@ -608,7 +608,7 @@ static void get_meta_and_pte_attr(
 								/ data_pitch),
 				1);
 
-		ASSERT(log2_dpte_row_height_linear >= 3);
+		ASSERT_WARN(log2_dpte_row_height_linear >= 3);
 
 		if (log2_dpte_row_height_linear > 7)
 			log2_dpte_row_height_linear = 7;
@@ -961,7 +961,7 @@ static void dml_rq_dlg_get_dlg_params(
 	dml_print("DML_DLG: %s: refclk_freq_in_mhz     = %3.2f\n", __func__, refclk_freq_in_mhz);
 	dml_print("DML_DLG: %s: pclk_freq_in_mhz       = %3.2f\n", __func__, pclk_freq_in_mhz);
 	dml_print("DML_DLG: %s: interlaced             = %d\n", __func__, interlaced);
-	ASSERT(ref_freq_to_pix_freq < 4.0);
+	ASSERT_WARN(ref_freq_to_pix_freq < 4.0);
 
 	disp_dlg_regs->ref_freq_to_pix_freq =
 			(unsigned int) (ref_freq_to_pix_freq * dml_pow(2, 19));
@@ -970,7 +970,7 @@ static void dml_rq_dlg_get_dlg_params(
 	disp_dlg_regs->dlg_vblank_end = interlaced ? (vblank_end / 2) : vblank_end; // 15 bits
 	disp_dlg_regs->refcyc_h_blank_end = (unsigned int) ((double) hblank_end
 			* (double) ref_freq_to_pix_freq);
-	ASSERT(disp_dlg_regs->refcyc_h_blank_end < (unsigned int)dml_pow(2, 13));
+	ASSERT_WARN(disp_dlg_regs->refcyc_h_blank_end < (unsigned int)dml_pow(2, 13));
 
 	min_dcfclk_mhz = dlg_sys_param->deepsleep_dcfclk_mhz;
 	t_calc_us = get_tcalc(mode_lib, e2e_pipe_param, num_pipes);
@@ -980,7 +980,7 @@ static void dml_rq_dlg_get_dlg_params(
 	dlg_vblank_start = interlaced ? (vblank_start / 2) : vblank_start;
 
 	disp_dlg_regs->min_dst_y_next_start = (unsigned int) (((double) dlg_vblank_start) * dml_pow(2, 2));
-	ASSERT(disp_dlg_regs->min_dst_y_next_start < (unsigned int)dml_pow(2, 18));
+	ASSERT_WARN(disp_dlg_regs->min_dst_y_next_start < (unsigned int)dml_pow(2, 18));
 
 	dml_print(
 			"DML_DLG: %s: min_dcfclk_mhz                         = %3.2f\n",
@@ -1164,10 +1164,10 @@ static void dml_rq_dlg_get_dlg_params(
 	dml_print("DML_DLG: %s: dst_y_per_vm_vblank  = %3.2f\n", __func__, dst_y_per_vm_vblank);
 	dml_print("DML_DLG: %s: dst_y_per_row_vblank = %3.2f\n", __func__, dst_y_per_row_vblank);
 
-	ASSERT(dst_y_per_vm_vblank < max_dst_y_per_vm_vblank);
-	ASSERT(dst_y_per_row_vblank < max_dst_y_per_row_vblank);
+	ASSERT_WARN(dst_y_per_vm_vblank < max_dst_y_per_vm_vblank);
+	ASSERT_WARN(dst_y_per_row_vblank < max_dst_y_per_row_vblank);
 
-	ASSERT(dst_y_prefetch > (dst_y_per_vm_vblank + dst_y_per_row_vblank));
+	ASSERT_WARN(dst_y_prefetch > (dst_y_per_vm_vblank + dst_y_per_row_vblank));
 	lsw = dst_y_prefetch - (dst_y_per_vm_vblank + dst_y_per_row_vblank);
 
 	dml_print("DML_DLG: %s: lsw = %3.2f\n", __func__, lsw);
@@ -1365,8 +1365,8 @@ static void dml_rq_dlg_get_dlg_params(
 			__func__,
 			refcyc_per_req_delivery_l);
 
-	ASSERT(refcyc_per_req_delivery_pre_l < dml_pow(2, 13));
-	ASSERT(refcyc_per_req_delivery_l < dml_pow(2, 13));
+	ASSERT_WARN(refcyc_per_req_delivery_pre_l < dml_pow(2, 13));
+	ASSERT_WARN(refcyc_per_req_delivery_l < dml_pow(2, 13));
 
 	if (dual_plane) {
 		refcyc_per_req_delivery_pre_c = get_refcyc_per_delivery(
@@ -1401,8 +1401,8 @@ static void dml_rq_dlg_get_dlg_params(
 				__func__,
 				refcyc_per_req_delivery_c);
 
-		ASSERT(refcyc_per_req_delivery_pre_c < dml_pow(2, 13));
-		ASSERT(refcyc_per_req_delivery_c < dml_pow(2, 13));
+		ASSERT_WARN(refcyc_per_req_delivery_pre_c < dml_pow(2, 13));
+		ASSERT_WARN(refcyc_per_req_delivery_c < dml_pow(2, 13));
 	}
 
 	// TTU - Cursor
@@ -1446,7 +1446,7 @@ static void dml_rq_dlg_get_dlg_params(
 	// Assignment to register structures
 	disp_dlg_regs->dst_y_after_scaler = dst_y_after_scaler; // in terms of line
 	disp_dlg_regs->refcyc_x_after_scaler = dst_x_after_scaler * ref_freq_to_pix_freq; // in terms of refclk
-	ASSERT(disp_dlg_regs->refcyc_x_after_scaler < (unsigned int)dml_pow(2, 13));
+	ASSERT_WARN(disp_dlg_regs->refcyc_x_after_scaler < (unsigned int)dml_pow(2, 13));
 	disp_dlg_regs->dst_y_prefetch = (unsigned int) (dst_y_prefetch * dml_pow(2, 2));
 	disp_dlg_regs->dst_y_per_vm_vblank = (unsigned int) (dst_y_per_vm_vblank * dml_pow(2, 2));
 	disp_dlg_regs->dst_y_per_row_vblank = (unsigned int) (dst_y_per_row_vblank * dml_pow(2, 2));
@@ -1468,7 +1468,7 @@ static void dml_rq_dlg_get_dlg_params(
 			disp_dlg_regs->refcyc_per_pte_group_vblank_l >= (unsigned int)dml_pow(2, 13))
 		disp_dlg_regs->refcyc_per_pte_group_vblank_l = (1 << 13) - 1;
 	else
-		ASSERT(disp_dlg_regs->refcyc_per_pte_group_vblank_l < (unsigned int)dml_pow(2, 13));
+		ASSERT_WARN(disp_dlg_regs->refcyc_per_pte_group_vblank_l < (unsigned int)dml_pow(2, 13));
 
 	if (dual_plane) {
 		disp_dlg_regs->refcyc_per_pte_group_vblank_c = (unsigned int) (dst_y_per_row_vblank
@@ -1478,7 +1478,7 @@ static void dml_rq_dlg_get_dlg_params(
 				disp_dlg_regs->refcyc_per_pte_group_vblank_c >= (unsigned int)dml_pow(2, 13))
 			disp_dlg_regs->refcyc_per_pte_group_vblank_c = (1 << 13) - 1;
 		else
-			ASSERT(disp_dlg_regs->refcyc_per_pte_group_vblank_c
+			ASSERT_WARN(disp_dlg_regs->refcyc_per_pte_group_vblank_c
 				< (unsigned int)dml_pow(2, 13));
 	}
 
@@ -1488,7 +1488,7 @@ static void dml_rq_dlg_get_dlg_params(
 					* ref_freq_to_pix_freq / (double) meta_chunks_per_row_ub_l);
 	else
 		disp_dlg_regs->refcyc_per_meta_chunk_vblank_l = 0;
-	ASSERT(disp_dlg_regs->refcyc_per_meta_chunk_vblank_l < (unsigned int)dml_pow(2, 13));
+	ASSERT_WARN(disp_dlg_regs->refcyc_per_meta_chunk_vblank_l < (unsigned int)dml_pow(2, 13));
 
 	disp_dlg_regs->refcyc_per_meta_chunk_vblank_c =
 			disp_dlg_regs->refcyc_per_meta_chunk_vblank_l; // dcc for 4:2:0 is not supported in dcn1.0.  assigned to be the same as _l for now
@@ -1524,7 +1524,7 @@ static void dml_rq_dlg_get_dlg_params(
 		disp_dlg_regs->refcyc_per_vm_req_flip = dml_pow(2, 23) - 1;
 	disp_dlg_regs->dst_y_per_pte_row_nom_l = (unsigned int) ((double) dpte_row_height_l
 			/ (double) vratio_l * dml_pow(2, 2));
-	ASSERT(disp_dlg_regs->dst_y_per_pte_row_nom_l < (unsigned int)dml_pow(2, 17));
+	ASSERT_WARN(disp_dlg_regs->dst_y_per_pte_row_nom_l < (unsigned int)dml_pow(2, 17));
 
 	if (dual_plane) {
 		disp_dlg_regs->dst_y_per_pte_row_nom_c = (unsigned int) ((double) dpte_row_height_c
@@ -1540,7 +1540,7 @@ static void dml_rq_dlg_get_dlg_params(
 
 	disp_dlg_regs->dst_y_per_meta_row_nom_l = (unsigned int) ((double) meta_row_height_l
 			/ (double) vratio_l * dml_pow(2, 2));
-	ASSERT(disp_dlg_regs->dst_y_per_meta_row_nom_l < (unsigned int)dml_pow(2, 17));
+	ASSERT_WARN(disp_dlg_regs->dst_y_per_meta_row_nom_l < (unsigned int)dml_pow(2, 17));
 
 	disp_dlg_regs->dst_y_per_meta_row_nom_c = disp_dlg_regs->dst_y_per_meta_row_nom_l; // TODO: dcc for 4:2:0 is not supported in dcn1.0.  assigned to be the same as _l for now
 
@@ -1580,15 +1580,15 @@ static void dml_rq_dlg_get_dlg_params(
 			refcyc_per_line_delivery_pre_l, 1);
 	disp_dlg_regs->refcyc_per_line_delivery_l = (unsigned int) dml_floor(
 			refcyc_per_line_delivery_l, 1);
-	ASSERT(disp_dlg_regs->refcyc_per_line_delivery_pre_l < (unsigned int)dml_pow(2, 13));
-	ASSERT(disp_dlg_regs->refcyc_per_line_delivery_l < (unsigned int)dml_pow(2, 13));
+	ASSERT_WARN(disp_dlg_regs->refcyc_per_line_delivery_pre_l < (unsigned int)dml_pow(2, 13));
+	ASSERT_WARN(disp_dlg_regs->refcyc_per_line_delivery_l < (unsigned int)dml_pow(2, 13));
 
 	disp_dlg_regs->refcyc_per_line_delivery_pre_c = (unsigned int) dml_floor(
 			refcyc_per_line_delivery_pre_c, 1);
 	disp_dlg_regs->refcyc_per_line_delivery_c = (unsigned int) dml_floor(
 			refcyc_per_line_delivery_c, 1);
-	ASSERT(disp_dlg_regs->refcyc_per_line_delivery_pre_c < (unsigned int)dml_pow(2, 13));
-	ASSERT(disp_dlg_regs->refcyc_per_line_delivery_c < (unsigned int)dml_pow(2, 13));
+	ASSERT_WARN(disp_dlg_regs->refcyc_per_line_delivery_pre_c < (unsigned int)dml_pow(2, 13));
+	ASSERT_WARN(disp_dlg_regs->refcyc_per_line_delivery_c < (unsigned int)dml_pow(2, 13));
 
 	disp_dlg_regs->chunk_hdl_adjust_cur0 = 3;
 	disp_dlg_regs->dst_y_offset_cur0 = 0;
@@ -1614,10 +1614,10 @@ static void dml_rq_dlg_get_dlg_params(
 	disp_ttu_regs->refcyc_per_req_delivery_cur1 = (unsigned int) (refcyc_per_req_delivery_cur1
 			* dml_pow(2, 10));
 	disp_ttu_regs->qos_level_low_wm = 0;
-	ASSERT(disp_ttu_regs->qos_level_low_wm < dml_pow(2, 14));
+	ASSERT_WARN(disp_ttu_regs->qos_level_low_wm < dml_pow(2, 14));
 	disp_ttu_regs->qos_level_high_wm = (unsigned int) (4.0 * (double) htotal
 			* ref_freq_to_pix_freq);
-	ASSERT(disp_ttu_regs->qos_level_high_wm < dml_pow(2, 14));
+	ASSERT_WARN(disp_ttu_regs->qos_level_high_wm < dml_pow(2, 14));
 
 	disp_ttu_regs->qos_level_flip = 14;
 	disp_ttu_regs->qos_level_fixed_l = 8;
@@ -1628,7 +1628,7 @@ static void dml_rq_dlg_get_dlg_params(
 	disp_ttu_regs->qos_ramp_disable_cur0 = 0;
 
 	disp_ttu_regs->min_ttu_vblank = min_ttu_vblank * refclk_freq_in_mhz;
-	ASSERT(disp_ttu_regs->min_ttu_vblank < dml_pow(2, 24));
+	ASSERT_WARN(disp_ttu_regs->min_ttu_vblank < dml_pow(2, 24));
 
 	print__ttu_regs_st(mode_lib, disp_ttu_regs);
 	print__dlg_regs_st(mode_lib, disp_dlg_regs);
@@ -1709,7 +1709,7 @@ static void calculate_ttu_cursor(
 	double cur_req_per_width = 0.0;
 	double hactive_cur = 0.0;
 
-	ASSERT(cur_src_width <= 256);
+	ASSERT_WARN(cur_src_width <= 256);
 
 	*refcyc_per_req_delivery_pre_cur = 0.0;
 	*refcyc_per_req_delivery_cur = 0.0;
@@ -1744,7 +1744,7 @@ static void calculate_ttu_cursor(
 					/ (double) cur_req_per_width;
 		}
 
-		ASSERT(*refcyc_per_req_delivery_pre_cur < dml_pow(2, 13));
+		ASSERT_WARN(*refcyc_per_req_delivery_pre_cur < dml_pow(2, 13));
 
 		if (vratio_l <= 1.0) {
 			*refcyc_per_req_delivery_cur = hactive_cur * ref_freq_to_pix_freq
@@ -1780,7 +1780,7 @@ static void calculate_ttu_cursor(
 				__func__,
 				*refcyc_per_req_delivery_cur);
 
-		ASSERT(*refcyc_per_req_delivery_cur < dml_pow(2, 13));
+		ASSERT_WARN(*refcyc_per_req_delivery_cur < dml_pow(2, 13));
 	}
 }
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c
index aac0a0ae2966..ea554badb8a8 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c
@@ -202,7 +202,7 @@ void optc3_fpu_set_vrr_m_const(struct timing_generator *optc,
 	 */
 	REG_GET(OTG_V_BLANK_START_END, OTG_V_BLANK_START,
 		&vblank_start);
-	ASSERT(vtotal_min >= vblank_start + 1);
+	ASSERT_WARN(vtotal_min >= vblank_start + 1);
 
 	/* Special case where the average frame rate can be achieved
 	 * without using the DTO
@@ -716,7 +716,7 @@ int dcn30_find_dummy_latency_index_for_fw_based_mclk_switch(struct dc *dc,
 	}
 
 	if (dummy_latency_index == max_latency_table_entries) {
-		ASSERT(dummy_latency_index != max_latency_table_entries);
+		ASSERT_WARN(dummy_latency_index != max_latency_table_entries);
 		/* If the execution gets here, it means dummy p_states are
 		 * not possible. This should never happen and would mean
 		 * something is severely wrong.
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
index cee1b351e105..b64be6395f40 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
@@ -1967,7 +1967,7 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 			v->DISPCLKWithoutRamping,
 			v->WritebackDISPCLK);
 
-	ASSERT(v->DISPCLKDPPCLKVCOSpeed != 0);
+	ASSERT_WARN(v->DISPCLKDPPCLKVCOSpeed != 0);
 	v->DISPCLKWithRampingRoundedToDFSGranularity = RoundToDFSGranularityUp(
 			v->DISPCLKWithRamping,
 			v->DISPCLKDPPCLKVCOSpeed);
@@ -2721,7 +2721,7 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 				!v->HostVMEnable && v->ImmediateFlipRequirement[0] != dm_immediate_flip_required) ||
 				v->ImmediateFlipSupported)) ? true : false;
 	} while (!v->PrefetchModeSupported && v->VStartupLines <= v->MaximumMaxVStartupLines);
-	ASSERT(v->PrefetchModeSupported);
+	ASSERT_WARN(v->PrefetchModeSupported);
 
 	//Watermarks and NB P-State/DRAM Clock Change Support
 	{
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.c b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.c
index 76d3bb3c9155..3aa60174d780 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.c
@@ -578,7 +578,7 @@ static void get_meta_and_pte_attr(struct display_mode_lib *mode_lib,
 		dml_print("DML_DLG: %s: dpte_buf_in_pte_reqs        = %d\n", __func__, dpte_buf_in_pte_reqs);
 		dml_print("DML_DLG: %s: log2_dpte_row_height_linear = %d\n", __func__, log2_dpte_row_height_linear);
 
-		ASSERT(log2_dpte_row_height_linear >= 3);
+		ASSERT_WARN(log2_dpte_row_height_linear >= 3);
 
 		if (log2_dpte_row_height_linear > 7)
 			log2_dpte_row_height_linear = 7;
@@ -811,7 +811,7 @@ static void calculate_ttu_cursor(struct display_mode_lib *mode_lib,
 	double cur_req_per_width = 0.0;
 	double hactive_cur = 0.0;
 
-	ASSERT(cur_src_width <= 256);
+	ASSERT_WARN(cur_src_width <= 256);
 
 	*refcyc_per_req_delivery_pre_cur = 0.0;
 	*refcyc_per_req_delivery_cur = 0.0;
@@ -846,7 +846,7 @@ static void calculate_ttu_cursor(struct display_mode_lib *mode_lib,
 				/ (double)cur_req_per_width;
 		}
 
-		ASSERT(*refcyc_per_req_delivery_pre_cur < dml_pow(2, 13));
+		ASSERT_WARN(*refcyc_per_req_delivery_pre_cur < dml_pow(2, 13));
 
 		if (vratio_l <= 1.0) {
 			*refcyc_per_req_delivery_cur = hactive_cur * ref_freq_to_pix_freq
@@ -876,7 +876,7 @@ static void calculate_ttu_cursor(struct display_mode_lib *mode_lib,
 			__func__,
 			*refcyc_per_req_delivery_cur);
 
-		ASSERT(*refcyc_per_req_delivery_cur < dml_pow(2, 13));
+		ASSERT_WARN(*refcyc_per_req_delivery_cur < dml_pow(2, 13));
 	}
 }
 
@@ -1032,7 +1032,7 @@ static void dml_rq_dlg_get_dlg_params(struct display_mode_lib *mode_lib,
 	dml_print("DML_DLG: %s: refclk_freq_in_mhz     = %3.2f\n", __func__, refclk_freq_in_mhz);
 	dml_print("DML_DLG: %s: pclk_freq_in_mhz       = %3.2f\n", __func__, pclk_freq_in_mhz);
 	dml_print("DML_DLG: %s: interlaced             = %d\n", __func__, interlaced);
-	ASSERT(ref_freq_to_pix_freq < 4.0);
+	ASSERT_WARN(ref_freq_to_pix_freq < 4.0);
 
 	disp_dlg_regs->ref_freq_to_pix_freq =
 		(unsigned int)(ref_freq_to_pix_freq * dml_pow(2, 19));
@@ -1049,7 +1049,7 @@ static void dml_rq_dlg_get_dlg_params(struct display_mode_lib *mode_lib,
 
 	disp_dlg_regs->min_dst_y_next_start = (unsigned int)(((double)dlg_vblank_start
 		) * dml_pow(2, 2));
-	ASSERT(disp_dlg_regs->min_dst_y_next_start < (unsigned int)dml_pow(2, 18));
+	ASSERT_WARN(disp_dlg_regs->min_dst_y_next_start < (unsigned int)dml_pow(2, 18));
 
 	dml_print("DML_DLG: %s: min_dcfclk_mhz                         = %3.2f\n",
 		__func__,
@@ -1213,7 +1213,7 @@ static void dml_rq_dlg_get_dlg_params(struct display_mode_lib *mode_lib,
 		unsigned int   odm_pipe_index = pipe_index_in_combine[pipe_idx];
 		disp_dlg_regs->refcyc_h_blank_end = (unsigned int)(((double) hblank_end + odm_pipe_index * (double) dst->hactive / odm_combine_factor) * ref_freq_to_pix_freq);
 	}
-	ASSERT(disp_dlg_regs->refcyc_h_blank_end < (unsigned int)dml_pow(2, 13));
+	ASSERT_WARN(disp_dlg_regs->refcyc_h_blank_end < (unsigned int)dml_pow(2, 13));
 
 	dml_print("DML_DLG: %s: htotal                                     = %d\n", __func__, htotal);
 	dml_print("DML_DLG: %s: pixel_rate_delay_subtotal                  = %d\n",
@@ -1268,10 +1268,10 @@ static void dml_rq_dlg_get_dlg_params(struct display_mode_lib *mode_lib,
 	dml_print("DML_DLG: %s: dst_y_per_vm_vblank  = %3.2f\n", __func__, dst_y_per_vm_vblank);
 	dml_print("DML_DLG: %s: dst_y_per_row_vblank = %3.2f\n", __func__, dst_y_per_row_vblank);
 
-	ASSERT(dst_y_per_vm_vblank < max_dst_y_per_vm_vblank);
-	ASSERT(dst_y_per_row_vblank < max_dst_y_per_row_vblank);
+	ASSERT_WARN(dst_y_per_vm_vblank < max_dst_y_per_vm_vblank);
+	ASSERT_WARN(dst_y_per_row_vblank < max_dst_y_per_row_vblank);
 
-	ASSERT(dst_y_prefetch > (dst_y_per_vm_vblank + dst_y_per_row_vblank));
+	ASSERT_WARN(dst_y_prefetch > (dst_y_per_vm_vblank + dst_y_per_row_vblank));
 	lsw = dst_y_prefetch - (dst_y_per_vm_vblank + dst_y_per_row_vblank);
 
 	dml_print("DML_DLG: %s: lsw = %3.2f\n", __func__, lsw);
@@ -1472,8 +1472,8 @@ static void dml_rq_dlg_get_dlg_params(struct display_mode_lib *mode_lib,
 		__func__,
 		refcyc_per_req_delivery_l);
 
-	ASSERT(refcyc_per_req_delivery_pre_l < dml_pow(2, 13));
-	ASSERT(refcyc_per_req_delivery_l < dml_pow(2, 13));
+	ASSERT_WARN(refcyc_per_req_delivery_pre_l < dml_pow(2, 13));
+	ASSERT_WARN(refcyc_per_req_delivery_l < dml_pow(2, 13));
 
 	if (dual_plane) {
 		refcyc_per_req_delivery_pre_c = get_refcyc_per_delivery(mode_lib,
@@ -1504,8 +1504,8 @@ static void dml_rq_dlg_get_dlg_params(struct display_mode_lib *mode_lib,
 			__func__,
 			refcyc_per_req_delivery_c);
 
-		ASSERT(refcyc_per_req_delivery_pre_c < dml_pow(2, 13));
-		ASSERT(refcyc_per_req_delivery_c < dml_pow(2, 13));
+		ASSERT_WARN(refcyc_per_req_delivery_pre_c < dml_pow(2, 13));
+		ASSERT_WARN(refcyc_per_req_delivery_c < dml_pow(2, 13));
 	}
 
 	// TTU - Cursor
@@ -1546,9 +1546,9 @@ static void dml_rq_dlg_get_dlg_params(struct display_mode_lib *mode_lib,
 
 	// Assignment to register structures
 	disp_dlg_regs->dst_y_after_scaler = dst_y_after_scaler; // in terms of line
-	ASSERT(disp_dlg_regs->dst_y_after_scaler < (unsigned int)8);
+	ASSERT_WARN(disp_dlg_regs->dst_y_after_scaler < (unsigned int)8);
 	disp_dlg_regs->refcyc_x_after_scaler = dst_x_after_scaler * ref_freq_to_pix_freq; // in terms of refclk
-	ASSERT(disp_dlg_regs->refcyc_x_after_scaler < (unsigned int)dml_pow(2, 13));
+	ASSERT_WARN(disp_dlg_regs->refcyc_x_after_scaler < (unsigned int)dml_pow(2, 13));
 	disp_dlg_regs->dst_y_prefetch = (unsigned int)(dst_y_prefetch * dml_pow(2, 2));
 	disp_dlg_regs->dst_y_per_vm_vblank = (unsigned int)(dst_y_per_vm_vblank * dml_pow(2, 2));
 	disp_dlg_regs->dst_y_per_row_vblank = (unsigned int)(dst_y_per_row_vblank * dml_pow(2, 2));
@@ -1565,20 +1565,20 @@ static void dml_rq_dlg_get_dlg_params(struct display_mode_lib *mode_lib,
 	disp_dlg_regs->refcyc_per_pte_group_vblank_l =
 		(unsigned int)(dst_y_per_row_vblank * (double)htotal
 			* ref_freq_to_pix_freq / (double)dpte_groups_per_row_ub_l);
-	ASSERT(disp_dlg_regs->refcyc_per_pte_group_vblank_l < (unsigned int)dml_pow(2, 13));
+	ASSERT_WARN(disp_dlg_regs->refcyc_per_pte_group_vblank_l < (unsigned int)dml_pow(2, 13));
 
 	if (dual_plane) {
 		disp_dlg_regs->refcyc_per_pte_group_vblank_c = (unsigned int)(dst_y_per_row_vblank
 			* (double)htotal * ref_freq_to_pix_freq
 			/ (double)dpte_groups_per_row_ub_c);
-		ASSERT(disp_dlg_regs->refcyc_per_pte_group_vblank_c
+		ASSERT_WARN(disp_dlg_regs->refcyc_per_pte_group_vblank_c
 			< (unsigned int)dml_pow(2, 13));
 	}
 
 	disp_dlg_regs->refcyc_per_meta_chunk_vblank_l =
 		(unsigned int)(dst_y_per_row_vblank * (double)htotal
 			* ref_freq_to_pix_freq / (double)meta_chunks_per_row_ub_l);
-	ASSERT(disp_dlg_regs->refcyc_per_meta_chunk_vblank_l < (unsigned int)dml_pow(2, 13));
+	ASSERT_WARN(disp_dlg_regs->refcyc_per_meta_chunk_vblank_l < (unsigned int)dml_pow(2, 13));
 
 	disp_dlg_regs->refcyc_per_meta_chunk_vblank_c =
 		disp_dlg_regs->refcyc_per_meta_chunk_vblank_l; // dcc for 4:2:0 is not supported in dcn1.0.  assigned to be the same as _l for now
@@ -1615,7 +1615,7 @@ static void dml_rq_dlg_get_dlg_params(struct display_mode_lib *mode_lib,
 
 	disp_dlg_regs->dst_y_per_pte_row_nom_l = (unsigned int)((double)dpte_row_height_l
 		/ (double)vratio_l * dml_pow(2, 2));
-	ASSERT(disp_dlg_regs->dst_y_per_pte_row_nom_l < (unsigned int)dml_pow(2, 17));
+	ASSERT_WARN(disp_dlg_regs->dst_y_per_pte_row_nom_l < (unsigned int)dml_pow(2, 17));
 
 	if (dual_plane) {
 		disp_dlg_regs->dst_y_per_pte_row_nom_c = (unsigned int)((double)dpte_row_height_c
@@ -1630,7 +1630,7 @@ static void dml_rq_dlg_get_dlg_params(struct display_mode_lib *mode_lib,
 
 	disp_dlg_regs->dst_y_per_meta_row_nom_l = (unsigned int)((double)meta_row_height_l
 		/ (double)vratio_l * dml_pow(2, 2));
-	ASSERT(disp_dlg_regs->dst_y_per_meta_row_nom_l < (unsigned int)dml_pow(2, 17));
+	ASSERT_WARN(disp_dlg_regs->dst_y_per_meta_row_nom_l < (unsigned int)dml_pow(2, 17));
 
 	disp_dlg_regs->dst_y_per_meta_row_nom_c = disp_dlg_regs->dst_y_per_meta_row_nom_l; // TODO: dcc for 4:2:0 is not supported in dcn1.0.  assigned to be the same as _l for now
 
@@ -1668,15 +1668,15 @@ static void dml_rq_dlg_get_dlg_params(struct display_mode_lib *mode_lib,
 		1);
 	disp_dlg_regs->refcyc_per_line_delivery_l = (unsigned int)dml_floor(refcyc_per_line_delivery_l,
 		1);
-	ASSERT(disp_dlg_regs->refcyc_per_line_delivery_pre_l < (unsigned int)dml_pow(2, 13));
-	ASSERT(disp_dlg_regs->refcyc_per_line_delivery_l < (unsigned int)dml_pow(2, 13));
+	ASSERT_WARN(disp_dlg_regs->refcyc_per_line_delivery_pre_l < (unsigned int)dml_pow(2, 13));
+	ASSERT_WARN(disp_dlg_regs->refcyc_per_line_delivery_l < (unsigned int)dml_pow(2, 13));
 
 	disp_dlg_regs->refcyc_per_line_delivery_pre_c = (unsigned int)dml_floor(refcyc_per_line_delivery_pre_c,
 		1);
 	disp_dlg_regs->refcyc_per_line_delivery_c = (unsigned int)dml_floor(refcyc_per_line_delivery_c,
 		1);
-	ASSERT(disp_dlg_regs->refcyc_per_line_delivery_pre_c < (unsigned int)dml_pow(2, 13));
-	ASSERT(disp_dlg_regs->refcyc_per_line_delivery_c < (unsigned int)dml_pow(2, 13));
+	ASSERT_WARN(disp_dlg_regs->refcyc_per_line_delivery_pre_c < (unsigned int)dml_pow(2, 13));
+	ASSERT_WARN(disp_dlg_regs->refcyc_per_line_delivery_c < (unsigned int)dml_pow(2, 13));
 
 	disp_dlg_regs->chunk_hdl_adjust_cur0 = 3;
 	disp_dlg_regs->dst_y_offset_cur0 = 0;
@@ -1702,10 +1702,10 @@ static void dml_rq_dlg_get_dlg_params(struct display_mode_lib *mode_lib,
 	disp_ttu_regs->refcyc_per_req_delivery_cur1 = (unsigned int)(refcyc_per_req_delivery_cur1
 		* dml_pow(2, 10));
 	disp_ttu_regs->qos_level_low_wm = 0;
-	ASSERT(disp_ttu_regs->qos_level_low_wm < dml_pow(2, 14));
+	ASSERT_WARN(disp_ttu_regs->qos_level_low_wm < dml_pow(2, 14));
 	disp_ttu_regs->qos_level_high_wm = (unsigned int)(4.0 * (double)htotal
 		* ref_freq_to_pix_freq);
-	ASSERT(disp_ttu_regs->qos_level_high_wm < dml_pow(2, 14));
+	ASSERT_WARN(disp_ttu_regs->qos_level_high_wm < dml_pow(2, 14));
 
 	disp_ttu_regs->qos_level_flip = 14;
 	disp_ttu_regs->qos_level_fixed_l = 8;
@@ -1716,7 +1716,7 @@ static void dml_rq_dlg_get_dlg_params(struct display_mode_lib *mode_lib,
 	disp_ttu_regs->qos_ramp_disable_cur0 = 0;
 
 	disp_ttu_regs->min_ttu_vblank = min_ttu_vblank * refclk_freq_in_mhz;
-	ASSERT(disp_ttu_regs->min_ttu_vblank < dml_pow(2, 24));
+	ASSERT_WARN(disp_ttu_regs->min_ttu_vblank < dml_pow(2, 24));
 
 	print__ttu_regs_st(mode_lib, disp_ttu_regs);
 	print__dlg_regs_st(mode_lib, disp_dlg_regs);
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.c
index 0c0b2d67c9cd..522775ee217e 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.c
@@ -298,7 +298,7 @@ static void calculate_wm_set_for_vlevel(int vlevel,
 {
 	double dram_clock_change_latency_cached = dml->soc.dram_clock_change_latency_us;
 
-	ASSERT(vlevel < dml->soc.num_states);
+	ASSERT_WARN(vlevel < dml->soc.num_states);
 	/* only pipe 0 is read for voltage and dcf/soc clocks */
 	pipes[0].clks_cfg.voltage = vlevel;
 	pipes[0].clks_cfg.dcfclk_mhz = dml->soc.clock_limits[vlevel].dcfclk_mhz;
@@ -337,7 +337,7 @@ void dcn301_fpu_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_p
 	dcn3_01_ip.max_num_dpp = pool->base.pipe_count;
 	dcn3_01_soc.num_chans = bw_params->num_channels;
 
-	ASSERT(clk_table->num_entries);
+	ASSERT_WARN(clk_table->num_entries);
 	for (i = 0; i < clk_table->num_entries; i++) {
 		/* loop backwards*/
 		for (closest_clk_lvl = 0, j = dcn3_01_soc.num_states - 1; j >= 0; j--) {
@@ -420,7 +420,7 @@ void dcn301_fpu_calculate_wm_and_dlg(struct dc *dc,
 	struct wm_range_table_entry *table_entry;
 	struct clk_bw_params *bw_params = dc->clk_mgr->bw_params;
 
-	ASSERT(bw_params);
+	ASSERT_WARN(bw_params);
 	dc_assert_fp_enabled();
 
 	vlevel_max = bw_params->clk_table.num_entries - 1;
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn302/dcn302_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn302/dcn302_fpu.c
index 8da97a96b1ce..2a2d2638ee98 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn302/dcn302_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn302/dcn302_fpu.c
@@ -310,7 +310,7 @@ void dcn302_fpu_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_p
 		 * DC__VOLTAGE_STATES is 40.
 		 */
 		if (num_states > MAX_NUM_DPM_LVL) {
-			ASSERT(0);
+			ASSERT_WARN(0);
 			return;
 		}
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn303/dcn303_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn303/dcn303_fpu.c
index e968870a4b81..a49e91416b70 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn303/dcn303_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn303/dcn303_fpu.c
@@ -316,7 +316,7 @@ void dcn303_fpu_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_p
 		 * DC__VOLTAGE_STATES is 40.
 		 */
 		if (num_states > MAX_NUM_DPM_LVL) {
-			ASSERT(0);
+			ASSERT_WARN(0);
 			return;
 		}
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c
index 17a21bcbde17..8f27d9070778 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c
@@ -604,7 +604,7 @@ void dcn31_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_params
 	dcn3_1_ip.max_num_dpp = dc->res_pool->pipe_count;
 	dcn3_1_soc.num_chans = bw_params->num_channels;
 
-	ASSERT(clk_table->num_entries);
+	ASSERT_WARN(clk_table->num_entries);
 
 	/* Prepass to find max clocks independent of voltage level. */
 	for (i = 0; i < clk_table->num_entries; ++i) {
@@ -680,7 +680,7 @@ void dcn315_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_param
 	if (bw_params->dram_channel_width_bytes > 0)
 		dcn3_15_soc.dram_channel_width_bytes = bw_params->dram_channel_width_bytes;
 
-	ASSERT(clk_table->num_entries);
+	ASSERT_WARN(clk_table->num_entries);
 
 	/* Setup soc to always use max dispclk/dppclk to avoid odm-to-lower-voltage */
 	for (i = 0; i < clk_table->num_entries; ++i) {
@@ -743,7 +743,7 @@ void dcn316_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_param
 	dcn3_16_ip.max_num_dpp = dc->res_pool->pipe_count;
 	dcn3_16_soc.num_chans = bw_params->num_channels;
 
-	ASSERT(clk_table->num_entries);
+	ASSERT_WARN(clk_table->num_entries);
 
 	/* Prepass to find max clocks independent of voltage level. */
 	for (i = 0; i < clk_table->num_entries; ++i) {
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
index f567a9023682..6db6100b8c3e 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
@@ -2112,7 +2112,7 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 	v->DISPCLKWithRamping = dml_max(v->DISPCLKWithRamping, v->WritebackDISPCLK);
 	v->DISPCLKWithoutRamping = dml_max(v->DISPCLKWithoutRamping, v->WritebackDISPCLK);
 
-	ASSERT(v->DISPCLKDPPCLKVCOSpeed != 0);
+	ASSERT_WARN(v->DISPCLKDPPCLKVCOSpeed != 0);
 	v->DISPCLKWithRampingRoundedToDFSGranularity = RoundToDFSGranularityUp(v->DISPCLKWithRamping, v->DISPCLKDPPCLKVCOSpeed);
 	v->DISPCLKWithoutRampingRoundedToDFSGranularity = RoundToDFSGranularityUp(v->DISPCLKWithoutRamping, v->DISPCLKDPPCLKVCOSpeed);
 	v->MaxDispclkRoundedToDFSGranularity = RoundToDFSGranularityDown(
@@ -2913,7 +2913,7 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 
 		v->VStartupLines = v->VStartupLines + 1;
 	} while (!v->PrefetchAndImmediateFlipSupported && v->VStartupLines <= v->MaximumMaxVStartupLines);
-	ASSERT(v->PrefetchAndImmediateFlipSupported);
+	ASSERT_WARN(v->PrefetchAndImmediateFlipSupported);
 
 	// Unbounded Request Enabled
 	CalculateUnboundedRequestAndCompressedBufferSize(
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.c b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.c
index c46bda2141ac..ad99c45e435a 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.c
@@ -579,7 +579,7 @@ static void get_meta_and_pte_attr(
 		dml_print("DML_DLG: %s: dpte_buf_in_pte_reqs        = %d\n", __func__, dpte_buf_in_pte_reqs);
 		dml_print("DML_DLG: %s: log2_dpte_row_height_linear = %d\n", __func__, log2_dpte_row_height_linear);
 
-		ASSERT(log2_dpte_row_height_linear >= 3);
+		ASSERT_WARN(log2_dpte_row_height_linear >= 3);
 
 		if (log2_dpte_row_height_linear > 7)
 			log2_dpte_row_height_linear = 7;
@@ -792,7 +792,7 @@ static void calculate_ttu_cursor(
 	double cur_req_per_width = 0.0;
 	double hactive_cur = 0.0;
 
-	ASSERT(cur_src_width <= 256);
+	ASSERT_WARN(cur_src_width <= 256);
 
 	*refcyc_per_req_delivery_pre_cur = 0.0;
 	*refcyc_per_req_delivery_cur = 0.0;
@@ -823,7 +823,7 @@ static void calculate_ttu_cursor(
 			*refcyc_per_req_delivery_pre_cur = (double) refclk_freq_in_mhz * (double) cur_src_width / hscale_pixel_rate_l / (double) cur_req_per_width;
 		}
 
-		ASSERT(*refcyc_per_req_delivery_pre_cur < dml_pow(2, 13));
+		ASSERT_WARN(*refcyc_per_req_delivery_pre_cur < dml_pow(2, 13));
 
 		if (vratio_l <= 1.0) {
 			*refcyc_per_req_delivery_cur = hactive_cur * ref_freq_to_pix_freq / (double) cur_req_per_width;
@@ -838,7 +838,7 @@ static void calculate_ttu_cursor(
 		dml_print("DML_DLG: %s: refcyc_per_req_delivery_pre_cur   = %3.2f\n", __func__, *refcyc_per_req_delivery_pre_cur);
 		dml_print("DML_DLG: %s: refcyc_per_req_delivery_cur       = %3.2f\n", __func__, *refcyc_per_req_delivery_cur);
 
-		ASSERT(*refcyc_per_req_delivery_cur < dml_pow(2, 13));
+		ASSERT_WARN(*refcyc_per_req_delivery_cur < dml_pow(2, 13));
 	}
 }
 
@@ -970,7 +970,7 @@ static void dml_rq_dlg_get_dlg_params(
 	dml_print("DML_DLG: %s: dppclk_freq_in_mhz     = %3.2f\n", __func__, dppclk_freq_in_mhz);
 	dml_print("DML_DLG: %s: refclk_freq_in_mhz     = %3.2f\n", __func__, refclk_freq_in_mhz);
 	dml_print("DML_DLG: %s: pclk_freq_in_mhz       = %3.2f\n", __func__, pclk_freq_in_mhz);
-	dml_print("DML_DLG: %s: interlaced             = %d\n", __func__, interlaced); ASSERT(ref_freq_to_pix_freq < 4.0);
+	dml_print("DML_DLG: %s: interlaced             = %d\n", __func__, interlaced); ASSERT_WARN(ref_freq_to_pix_freq < 4.0);
 
 	disp_dlg_regs->ref_freq_to_pix_freq = (unsigned int) (ref_freq_to_pix_freq * dml_pow(2, 19));
 	disp_dlg_regs->refcyc_per_htotal = (unsigned int) (ref_freq_to_pix_freq * (double) htotal * dml_pow(2, 8));
@@ -982,7 +982,7 @@ static void dml_rq_dlg_get_dlg_params(
 	dlg_vblank_start = interlaced ? (vblank_start / 2) : vblank_start;
 	disp_dlg_regs->min_dst_y_next_start = (unsigned int) (((double) dlg_vblank_start) * dml_pow(2, 2));
 	disp_dlg_regs->min_dst_y_next_start_us = 0;
-	ASSERT(disp_dlg_regs->min_dst_y_next_start < (unsigned int)dml_pow(2, 18));
+	ASSERT_WARN(disp_dlg_regs->min_dst_y_next_start < (unsigned int)dml_pow(2, 18));
 
 	dml_print("DML_DLG: %s: min_ttu_vblank (us)         = %3.2f\n", __func__, min_ttu_vblank);
 	dml_print("DML_DLG: %s: min_dst_y_next_start        = 0x%0x\n", __func__, disp_dlg_regs->min_dst_y_next_start);
@@ -1086,7 +1086,7 @@ static void dml_rq_dlg_get_dlg_params(
 		unsigned int odm_combine_factor = (dst->odm_combine == dm_odm_combine_mode_2to1 ? 2 : 4); // TODO: We should really check that 4to1 is supported before setting it to 4
 		unsigned int odm_pipe_index = pipe_index_in_combine[pipe_idx];
 		disp_dlg_regs->refcyc_h_blank_end = (unsigned int) (((double) hblank_end + odm_pipe_index * (double) dst->hactive / odm_combine_factor) * ref_freq_to_pix_freq);
-	} ASSERT(disp_dlg_regs->refcyc_h_blank_end < (unsigned int)dml_pow(2, 13));
+	} ASSERT_WARN(disp_dlg_regs->refcyc_h_blank_end < (unsigned int)dml_pow(2, 13));
 
 	dml_print("DML_DLG: %s: htotal                     = %d\n", __func__, htotal);
 	dml_print("DML_DLG: %s: dst_x_after_scaler[%d]     = %d\n", __func__, pipe_idx, dst_x_after_scaler);
@@ -1113,9 +1113,9 @@ static void dml_rq_dlg_get_dlg_params(
 	dml_print("DML_DLG: %s: dst_y_per_vm_vblank  = %3.2f\n", __func__, dst_y_per_vm_vblank);
 	dml_print("DML_DLG: %s: dst_y_per_row_vblank = %3.2f\n", __func__, dst_y_per_row_vblank);
 
-	ASSERT(dst_y_per_vm_vblank < max_dst_y_per_vm_vblank); ASSERT(dst_y_per_row_vblank < max_dst_y_per_row_vblank);
+	ASSERT_WARN(dst_y_per_vm_vblank < max_dst_y_per_vm_vblank); ASSERT_WARN(dst_y_per_row_vblank < max_dst_y_per_row_vblank);
 
-	ASSERT(dst_y_prefetch > (dst_y_per_vm_vblank + dst_y_per_row_vblank));
+	ASSERT_WARN(dst_y_prefetch > (dst_y_per_vm_vblank + dst_y_per_row_vblank));
 
 	vratio_pre_l = get_vratio_prefetch_l(mode_lib, e2e_pipe_param, num_pipes, pipe_idx);    // From VBA
 	vratio_pre_c = get_vratio_prefetch_c(mode_lib, e2e_pipe_param, num_pipes, pipe_idx);    // From VBA
@@ -1315,7 +1315,7 @@ static void dml_rq_dlg_get_dlg_params(
 	//old_impl_vs_vba_impl("refcyc_per_req_delivery_pre_l", refcyc_per_req_delivery_pre_l, vba__refcyc_per_req_delivery_pre_l);
 	//old_impl_vs_vba_impl("refcyc_per_req_delivery_l", refcyc_per_req_delivery_l, vba__refcyc_per_req_delivery_l);
 
-	ASSERT(refcyc_per_req_delivery_pre_l < dml_pow(2, 13)); ASSERT(refcyc_per_req_delivery_l < dml_pow(2, 13));
+	ASSERT_WARN(refcyc_per_req_delivery_pre_l < dml_pow(2, 13)); ASSERT_WARN(refcyc_per_req_delivery_l < dml_pow(2, 13));
 
 	if (dual_plane) {
 		float vba__refcyc_per_req_delivery_pre_c = get_refcyc_per_req_delivery_pre_c_in_us(mode_lib, e2e_pipe_param, num_pipes, pipe_idx) * refclk_freq_in_mhz;  // From VBA
@@ -1352,14 +1352,14 @@ static void dml_rq_dlg_get_dlg_params(
 		//old_impl_vs_vba_impl("refcyc_per_req_delivery_pre_c", refcyc_per_req_delivery_pre_c, vba__refcyc_per_req_delivery_pre_c);
 		//old_impl_vs_vba_impl("refcyc_per_req_delivery_c", refcyc_per_req_delivery_c, vba__refcyc_per_req_delivery_c);
 
-		ASSERT(refcyc_per_req_delivery_pre_c < dml_pow(2, 13)); ASSERT(refcyc_per_req_delivery_c < dml_pow(2, 13));
+		ASSERT_WARN(refcyc_per_req_delivery_pre_c < dml_pow(2, 13)); ASSERT_WARN(refcyc_per_req_delivery_c < dml_pow(2, 13));
 	}
 
 	// TTU - Cursor
 	refcyc_per_req_delivery_pre_cur0 = 0.0;
 	refcyc_per_req_delivery_cur0 = 0.0;
 
-	ASSERT(src->num_cursors <= 1);
+	ASSERT_WARN(src->num_cursors <= 1);
 
 	if (src->num_cursors > 0) {
 		float vba__refcyc_per_req_delivery_pre_cur0;
@@ -1398,9 +1398,9 @@ static void dml_rq_dlg_get_dlg_params(
 
 	// Assignment to register structures
 	disp_dlg_regs->dst_y_after_scaler = dst_y_after_scaler;	// in terms of line
-	ASSERT(disp_dlg_regs->dst_y_after_scaler < (unsigned int)8);
+	ASSERT_WARN(disp_dlg_regs->dst_y_after_scaler < (unsigned int)8);
 	disp_dlg_regs->refcyc_x_after_scaler = dst_x_after_scaler * ref_freq_to_pix_freq;	// in terms of refclk
-	ASSERT(disp_dlg_regs->refcyc_x_after_scaler < (unsigned int)dml_pow(2, 13));
+	ASSERT_WARN(disp_dlg_regs->refcyc_x_after_scaler < (unsigned int)dml_pow(2, 13));
 	disp_dlg_regs->dst_y_prefetch = (unsigned int) (dst_y_prefetch * dml_pow(2, 2));
 	disp_dlg_regs->dst_y_per_vm_vblank = (unsigned int) (dst_y_per_vm_vblank * dml_pow(2, 2));
 	disp_dlg_regs->dst_y_per_row_vblank = (unsigned int) (dst_y_per_row_vblank * dml_pow(2, 2));
@@ -1416,15 +1416,15 @@ static void dml_rq_dlg_get_dlg_params(
 	dml_print("DML_DLG: %s: disp_dlg_regs->dst_y_per_row_flip   = 0x%x\n", __func__, disp_dlg_regs->dst_y_per_row_flip);
 
 	disp_dlg_regs->refcyc_per_pte_group_vblank_l = (unsigned int) (dst_y_per_row_vblank * (double) htotal * ref_freq_to_pix_freq / (double) dpte_groups_per_row_ub_l);
-	ASSERT(disp_dlg_regs->refcyc_per_pte_group_vblank_l < (unsigned int)dml_pow(2, 13));
+	ASSERT_WARN(disp_dlg_regs->refcyc_per_pte_group_vblank_l < (unsigned int)dml_pow(2, 13));
 
 	if (dual_plane) {
 		disp_dlg_regs->refcyc_per_pte_group_vblank_c = (unsigned int) (dst_y_per_row_vblank * (double) htotal * ref_freq_to_pix_freq / (double) dpte_groups_per_row_ub_c);
-		ASSERT(disp_dlg_regs->refcyc_per_pte_group_vblank_c < (unsigned int)dml_pow(2, 13));
+		ASSERT_WARN(disp_dlg_regs->refcyc_per_pte_group_vblank_c < (unsigned int)dml_pow(2, 13));
 	}
 
 	disp_dlg_regs->refcyc_per_meta_chunk_vblank_l = (unsigned int) (dst_y_per_row_vblank * (double) htotal * ref_freq_to_pix_freq / (double) meta_chunks_per_row_ub_l);
-	ASSERT(disp_dlg_regs->refcyc_per_meta_chunk_vblank_l < (unsigned int)dml_pow(2, 13));
+	ASSERT_WARN(disp_dlg_regs->refcyc_per_meta_chunk_vblank_l < (unsigned int)dml_pow(2, 13));
 
 	disp_dlg_regs->refcyc_per_meta_chunk_vblank_c = disp_dlg_regs->refcyc_per_meta_chunk_vblank_l; // dcc for 4:2:0 is not supported in dcn1.0.  assigned to be the same as _l for now
 
@@ -1455,7 +1455,7 @@ static void dml_rq_dlg_get_dlg_params(
 		disp_dlg_regs->refcyc_per_vm_req_flip = dml_pow(2, 23) - 1;
 
 	disp_dlg_regs->dst_y_per_pte_row_nom_l = (unsigned int) ((double) dpte_row_height_l / (double) vratio_l * dml_pow(2, 2));
-	ASSERT(disp_dlg_regs->dst_y_per_pte_row_nom_l < (unsigned int)dml_pow(2, 17));
+	ASSERT_WARN(disp_dlg_regs->dst_y_per_pte_row_nom_l < (unsigned int)dml_pow(2, 17));
 	if (dual_plane) {
 		disp_dlg_regs->dst_y_per_pte_row_nom_c = (unsigned int) ((double) dpte_row_height_c / (double) vratio_c * dml_pow(2, 2));
 		if (disp_dlg_regs->dst_y_per_pte_row_nom_c >= (unsigned int) dml_pow(2, 17)) {
@@ -1468,10 +1468,10 @@ static void dml_rq_dlg_get_dlg_params(
 	}
 
 	disp_dlg_regs->dst_y_per_meta_row_nom_l = (unsigned int) ((double) meta_row_height_l / (double) vratio_l * dml_pow(2, 2));
-	ASSERT(disp_dlg_regs->dst_y_per_meta_row_nom_l < (unsigned int)dml_pow(2, 17));
+	ASSERT_WARN(disp_dlg_regs->dst_y_per_meta_row_nom_l < (unsigned int)dml_pow(2, 17));
 
 	disp_dlg_regs->dst_y_per_meta_row_nom_c = (unsigned int) ((double) meta_row_height_c / (double) vratio_c * dml_pow(2, 2));
-	ASSERT(disp_dlg_regs->dst_y_per_meta_row_nom_c < (unsigned int)dml_pow(2, 17));
+	ASSERT_WARN(disp_dlg_regs->dst_y_per_meta_row_nom_c < (unsigned int)dml_pow(2, 17));
 
 	disp_dlg_regs->refcyc_per_pte_group_nom_l = (unsigned int) ((double) dpte_row_height_l / (double) vratio_l * (double) htotal * ref_freq_to_pix_freq
 			/ (double) dpte_groups_per_row_ub_l);
@@ -1497,11 +1497,11 @@ static void dml_rq_dlg_get_dlg_params(
 
 	disp_dlg_regs->refcyc_per_line_delivery_pre_l = (unsigned int) dml_floor(refcyc_per_line_delivery_pre_l, 1);
 	disp_dlg_regs->refcyc_per_line_delivery_l = (unsigned int) dml_floor(refcyc_per_line_delivery_l, 1);
-	ASSERT(disp_dlg_regs->refcyc_per_line_delivery_pre_l < (unsigned int)dml_pow(2, 13)); ASSERT(disp_dlg_regs->refcyc_per_line_delivery_l < (unsigned int)dml_pow(2, 13));
+	ASSERT_WARN(disp_dlg_regs->refcyc_per_line_delivery_pre_l < (unsigned int)dml_pow(2, 13)); ASSERT_WARN(disp_dlg_regs->refcyc_per_line_delivery_l < (unsigned int)dml_pow(2, 13));
 
 	disp_dlg_regs->refcyc_per_line_delivery_pre_c = (unsigned int) dml_floor(refcyc_per_line_delivery_pre_c, 1);
 	disp_dlg_regs->refcyc_per_line_delivery_c = (unsigned int) dml_floor(refcyc_per_line_delivery_c, 1);
-	ASSERT(disp_dlg_regs->refcyc_per_line_delivery_pre_c < (unsigned int)dml_pow(2, 13)); ASSERT(disp_dlg_regs->refcyc_per_line_delivery_c < (unsigned int)dml_pow(2, 13));
+	ASSERT_WARN(disp_dlg_regs->refcyc_per_line_delivery_pre_c < (unsigned int)dml_pow(2, 13)); ASSERT_WARN(disp_dlg_regs->refcyc_per_line_delivery_c < (unsigned int)dml_pow(2, 13));
 
 	disp_dlg_regs->chunk_hdl_adjust_cur0 = 3;
 	disp_dlg_regs->dst_y_offset_cur0 = 0;
@@ -1520,10 +1520,10 @@ static void dml_rq_dlg_get_dlg_params(
 	disp_ttu_regs->refcyc_per_req_delivery_cur1 = (unsigned int) (refcyc_per_req_delivery_cur1 * dml_pow(2, 10));
 
 	disp_ttu_regs->qos_level_low_wm = 0;
-	ASSERT(disp_ttu_regs->qos_level_low_wm < dml_pow(2, 14));
+	ASSERT_WARN(disp_ttu_regs->qos_level_low_wm < dml_pow(2, 14));
 
 	disp_ttu_regs->qos_level_high_wm = (unsigned int) (4.0 * (double) htotal * ref_freq_to_pix_freq);
-	ASSERT(disp_ttu_regs->qos_level_high_wm < dml_pow(2, 14));
+	ASSERT_WARN(disp_ttu_regs->qos_level_high_wm < dml_pow(2, 14));
 
 	disp_ttu_regs->qos_level_flip = 14;
 	disp_ttu_regs->qos_level_fixed_l = 8;
@@ -1534,7 +1534,7 @@ static void dml_rq_dlg_get_dlg_params(
 	disp_ttu_regs->qos_ramp_disable_cur0 = 0;
 
 	disp_ttu_regs->min_ttu_vblank = min_ttu_vblank * refclk_freq_in_mhz;
-	ASSERT(disp_ttu_regs->min_ttu_vblank < dml_pow(2, 24));
+	ASSERT_WARN(disp_ttu_regs->min_ttu_vblank < dml_pow(2, 24));
 
 	print__ttu_regs_st(mode_lib, disp_ttu_regs);
 	print__dlg_regs_st(mode_lib, disp_dlg_regs);
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c
index 21f637ae4add..3948139fc573 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn314/dcn314_fpu.c
@@ -201,8 +201,8 @@ void dcn314_update_bw_bounding_box_fpu(struct dc *dc, struct clk_bw_params *bw_p
 		if (bw_params->num_channels > 0)
 			dcn3_14_soc.num_chans = bw_params->num_channels;
 
-		ASSERT(dcn3_14_soc.num_chans);
-		ASSERT(clk_table->num_entries);
+		ASSERT_WARN(dcn3_14_soc.num_chans);
+		ASSERT_WARN(clk_table->num_entries);
 
 		/* Prepass to find max clocks independent of voltage level. */
 		for (i = 0; i < clk_table->num_entries; ++i) {
@@ -382,7 +382,7 @@ int dcn314_populate_dml_pipes_from_context_fpu(struct dc *dc, struct dc_state *c
 				pipes[pipe_cnt].dout.dsc_input_bpc = 12;
 				break;
 			default:
-				ASSERT(0);
+				ASSERT_WARN(0);
 				break;
 			}
 		}
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
index 5865e8fa2d8e..64a1bcdbcc52 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
@@ -2130,7 +2130,7 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 	v->DISPCLKWithRamping = dml_max(v->DISPCLKWithRamping, v->WritebackDISPCLK);
 	v->DISPCLKWithoutRamping = dml_max(v->DISPCLKWithoutRamping, v->WritebackDISPCLK);
 
-	ASSERT(v->DISPCLKDPPCLKVCOSpeed != 0);
+	ASSERT_WARN(v->DISPCLKDPPCLKVCOSpeed != 0);
 	v->DISPCLKWithRampingRoundedToDFSGranularity = RoundToDFSGranularityUp(v->DISPCLKWithRamping, v->DISPCLKDPPCLKVCOSpeed);
 	v->DISPCLKWithoutRampingRoundedToDFSGranularity = RoundToDFSGranularityUp(v->DISPCLKWithoutRamping, v->DISPCLKDPPCLKVCOSpeed);
 	v->MaxDispclkRoundedToDFSGranularity = RoundToDFSGranularityDown(
@@ -2931,7 +2931,7 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 
 		v->VStartupLines = v->VStartupLines + 1;
 	} while (!v->PrefetchAndImmediateFlipSupported && v->VStartupLines <= v->MaximumMaxVStartupLines);
-	ASSERT(v->PrefetchAndImmediateFlipSupported);
+	ASSERT_WARN(v->PrefetchAndImmediateFlipSupported);
 
 	// Unbounded Request Enabled
 	CalculateUnboundedRequestAndCompressedBufferSize(
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c
index b7d2a0caec11..10d2b78c828a 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c
@@ -667,7 +667,7 @@ static void get_meta_and_pte_attr(
 		dml_print("DML_DLG: %s: dpte_buf_in_pte_reqs        = %d\n", __func__, dpte_buf_in_pte_reqs);
 		dml_print("DML_DLG: %s: log2_dpte_row_height_linear = %d\n", __func__, log2_dpte_row_height_linear);
 
-		ASSERT(log2_dpte_row_height_linear >= 3);
+		ASSERT_WARN(log2_dpte_row_height_linear >= 3);
 
 		if (log2_dpte_row_height_linear > 7)
 			log2_dpte_row_height_linear = 7;
@@ -879,7 +879,7 @@ static void calculate_ttu_cursor(
 	double cur_req_per_width = 0.0;
 	double hactive_cur = 0.0;
 
-	ASSERT(cur_src_width <= 256);
+	ASSERT_WARN(cur_src_width <= 256);
 
 	*refcyc_per_req_delivery_pre_cur = 0.0;
 	*refcyc_per_req_delivery_cur = 0.0;
@@ -909,7 +909,7 @@ static void calculate_ttu_cursor(
 		else
 			*refcyc_per_req_delivery_pre_cur = (double) refclk_freq_in_mhz * (double) cur_src_width / hscale_pixel_rate_l / (double) cur_req_per_width;
 
-		ASSERT(*refcyc_per_req_delivery_pre_cur < dml_pow(2, 13));
+		ASSERT_WARN(*refcyc_per_req_delivery_pre_cur < dml_pow(2, 13));
 
 		if (vratio_l <= 1.0)
 			*refcyc_per_req_delivery_cur = hactive_cur * ref_freq_to_pix_freq / (double) cur_req_per_width;
@@ -923,7 +923,7 @@ static void calculate_ttu_cursor(
 		dml_print("DML_DLG: %s: refcyc_per_req_delivery_pre_cur   = %3.2f\n", __func__, *refcyc_per_req_delivery_pre_cur);
 		dml_print("DML_DLG: %s: refcyc_per_req_delivery_cur       = %3.2f\n", __func__, *refcyc_per_req_delivery_cur);
 
-		ASSERT(*refcyc_per_req_delivery_cur < dml_pow(2, 13));
+		ASSERT_WARN(*refcyc_per_req_delivery_cur < dml_pow(2, 13));
 	}
 }
 
@@ -1055,7 +1055,7 @@ static void dml_rq_dlg_get_dlg_params(
 	dml_print("DML_DLG: %s: dppclk_freq_in_mhz     = %3.2f\n", __func__, dppclk_freq_in_mhz);
 	dml_print("DML_DLG: %s: refclk_freq_in_mhz     = %3.2f\n", __func__, refclk_freq_in_mhz);
 	dml_print("DML_DLG: %s: pclk_freq_in_mhz       = %3.2f\n", __func__, pclk_freq_in_mhz);
-	dml_print("DML_DLG: %s: interlaced             = %d\n", __func__, interlaced); ASSERT(ref_freq_to_pix_freq < 4.0);
+	dml_print("DML_DLG: %s: interlaced             = %d\n", __func__, interlaced); ASSERT_WARN(ref_freq_to_pix_freq < 4.0);
 
 	disp_dlg_regs->ref_freq_to_pix_freq = (unsigned int) (ref_freq_to_pix_freq * dml_pow(2, 19));
 	disp_dlg_regs->refcyc_per_htotal = (unsigned int) (ref_freq_to_pix_freq * (double) htotal * dml_pow(2, 8));
@@ -1069,7 +1069,7 @@ static void dml_rq_dlg_get_dlg_params(
 		(vba__min_dst_y_next_start * dst->hactive) / (unsigned int) dst->pixel_rate_mhz;
 	disp_dlg_regs->min_dst_y_next_start = vba__min_dst_y_next_start * dml_pow(2, 2);
 
-	ASSERT(disp_dlg_regs->min_dst_y_next_start < (unsigned int)dml_pow(2, 18));
+	ASSERT_WARN(disp_dlg_regs->min_dst_y_next_start < (unsigned int)dml_pow(2, 18));
 
 	dml_print("DML_DLG: %s: min_ttu_vblank (us)         = %3.2f\n", __func__, min_ttu_vblank);
 	dml_print("DML_DLG: %s: min_dst_y_next_start        = 0x%0x\n", __func__, disp_dlg_regs->min_dst_y_next_start);
@@ -1174,7 +1174,7 @@ static void dml_rq_dlg_get_dlg_params(
 		unsigned int odm_pipe_index = pipe_index_in_combine[pipe_idx];
 
 		disp_dlg_regs->refcyc_h_blank_end = (unsigned int) (((double) hblank_end + odm_pipe_index * (double) dst->hactive / odm_combine_factor) * ref_freq_to_pix_freq);
-	} ASSERT(disp_dlg_regs->refcyc_h_blank_end < (unsigned int)dml_pow(2, 13));
+	} ASSERT_WARN(disp_dlg_regs->refcyc_h_blank_end < (unsigned int)dml_pow(2, 13));
 
 	dml_print("DML_DLG: %s: htotal                     = %d\n", __func__, htotal);
 	dml_print("DML_DLG: %s: dst_x_after_scaler[%d]     = %d\n", __func__, pipe_idx, dst_x_after_scaler);
@@ -1201,9 +1201,9 @@ static void dml_rq_dlg_get_dlg_params(
 	dml_print("DML_DLG: %s: dst_y_per_vm_vblank  = %3.2f\n", __func__, dst_y_per_vm_vblank);
 	dml_print("DML_DLG: %s: dst_y_per_row_vblank = %3.2f\n", __func__, dst_y_per_row_vblank);
 
-	ASSERT(dst_y_per_vm_vblank < max_dst_y_per_vm_vblank); ASSERT(dst_y_per_row_vblank < max_dst_y_per_row_vblank);
+	ASSERT_WARN(dst_y_per_vm_vblank < max_dst_y_per_vm_vblank); ASSERT_WARN(dst_y_per_row_vblank < max_dst_y_per_row_vblank);
 
-	ASSERT(dst_y_prefetch > (dst_y_per_vm_vblank + dst_y_per_row_vblank));
+	ASSERT_WARN(dst_y_prefetch > (dst_y_per_vm_vblank + dst_y_per_row_vblank));
 
 	vratio_pre_l = get_vratio_prefetch_l(mode_lib, e2e_pipe_param, num_pipes, pipe_idx);    // From VBA
 	vratio_pre_c = get_vratio_prefetch_c(mode_lib, e2e_pipe_param, num_pipes, pipe_idx);    // From VBA
@@ -1403,7 +1403,7 @@ static void dml_rq_dlg_get_dlg_params(
 	//old_impl_vs_vba_impl("refcyc_per_req_delivery_pre_l", refcyc_per_req_delivery_pre_l, vba__refcyc_per_req_delivery_pre_l);
 	//old_impl_vs_vba_impl("refcyc_per_req_delivery_l", refcyc_per_req_delivery_l, vba__refcyc_per_req_delivery_l);
 
-	ASSERT(refcyc_per_req_delivery_pre_l < dml_pow(2, 13)); ASSERT(refcyc_per_req_delivery_l < dml_pow(2, 13));
+	ASSERT_WARN(refcyc_per_req_delivery_pre_l < dml_pow(2, 13)); ASSERT_WARN(refcyc_per_req_delivery_l < dml_pow(2, 13));
 
 	if (dual_plane) {
 		float vba__refcyc_per_req_delivery_pre_c = get_refcyc_per_req_delivery_pre_c_in_us(mode_lib, e2e_pipe_param, num_pipes, pipe_idx) * refclk_freq_in_mhz;  // From VBA
@@ -1440,14 +1440,14 @@ static void dml_rq_dlg_get_dlg_params(
 		//old_impl_vs_vba_impl("refcyc_per_req_delivery_pre_c", refcyc_per_req_delivery_pre_c, vba__refcyc_per_req_delivery_pre_c);
 		//old_impl_vs_vba_impl("refcyc_per_req_delivery_c", refcyc_per_req_delivery_c, vba__refcyc_per_req_delivery_c);
 
-		ASSERT(refcyc_per_req_delivery_pre_c < dml_pow(2, 13)); ASSERT(refcyc_per_req_delivery_c < dml_pow(2, 13));
+		ASSERT_WARN(refcyc_per_req_delivery_pre_c < dml_pow(2, 13)); ASSERT_WARN(refcyc_per_req_delivery_c < dml_pow(2, 13));
 	}
 
 	// TTU - Cursor
 	refcyc_per_req_delivery_pre_cur0 = 0.0;
 	refcyc_per_req_delivery_cur0 = 0.0;
 
-	ASSERT(src->num_cursors <= 1);
+	ASSERT_WARN(src->num_cursors <= 1);
 
 	if (src->num_cursors > 0) {
 		float vba__refcyc_per_req_delivery_pre_cur0;
@@ -1486,9 +1486,9 @@ static void dml_rq_dlg_get_dlg_params(
 
 	// Assignment to register structures
 	disp_dlg_regs->dst_y_after_scaler = dst_y_after_scaler;	// in terms of line
-	ASSERT(disp_dlg_regs->dst_y_after_scaler < 8);
+	ASSERT_WARN(disp_dlg_regs->dst_y_after_scaler < 8);
 	disp_dlg_regs->refcyc_x_after_scaler = dst_x_after_scaler * ref_freq_to_pix_freq;	// in terms of refclk
-	ASSERT(disp_dlg_regs->refcyc_x_after_scaler < (unsigned int)dml_pow(2, 13));
+	ASSERT_WARN(disp_dlg_regs->refcyc_x_after_scaler < (unsigned int)dml_pow(2, 13));
 	disp_dlg_regs->dst_y_prefetch = (unsigned int) (dst_y_prefetch * dml_pow(2, 2));
 	disp_dlg_regs->dst_y_per_vm_vblank = (unsigned int) (dst_y_per_vm_vblank * dml_pow(2, 2));
 	disp_dlg_regs->dst_y_per_row_vblank = (unsigned int) (dst_y_per_row_vblank * dml_pow(2, 2));
@@ -1504,15 +1504,15 @@ static void dml_rq_dlg_get_dlg_params(
 	dml_print("DML_DLG: %s: disp_dlg_regs->dst_y_per_row_flip   = 0x%x\n", __func__, disp_dlg_regs->dst_y_per_row_flip);
 
 	disp_dlg_regs->refcyc_per_pte_group_vblank_l = (unsigned int) (dst_y_per_row_vblank * (double) htotal * ref_freq_to_pix_freq / (double) dpte_groups_per_row_ub_l);
-	ASSERT(disp_dlg_regs->refcyc_per_pte_group_vblank_l < (unsigned int)dml_pow(2, 13));
+	ASSERT_WARN(disp_dlg_regs->refcyc_per_pte_group_vblank_l < (unsigned int)dml_pow(2, 13));
 
 	if (dual_plane) {
 		disp_dlg_regs->refcyc_per_pte_group_vblank_c = (unsigned int) (dst_y_per_row_vblank * (double) htotal * ref_freq_to_pix_freq / (double) dpte_groups_per_row_ub_c);
-		ASSERT(disp_dlg_regs->refcyc_per_pte_group_vblank_c < (unsigned int)dml_pow(2, 13));
+		ASSERT_WARN(disp_dlg_regs->refcyc_per_pte_group_vblank_c < (unsigned int)dml_pow(2, 13));
 	}
 
 	disp_dlg_regs->refcyc_per_meta_chunk_vblank_l = (unsigned int) (dst_y_per_row_vblank * (double) htotal * ref_freq_to_pix_freq / (double) meta_chunks_per_row_ub_l);
-	ASSERT(disp_dlg_regs->refcyc_per_meta_chunk_vblank_l < (unsigned int)dml_pow(2, 13));
+	ASSERT_WARN(disp_dlg_regs->refcyc_per_meta_chunk_vblank_l < (unsigned int)dml_pow(2, 13));
 
 	disp_dlg_regs->refcyc_per_meta_chunk_vblank_c = disp_dlg_regs->refcyc_per_meta_chunk_vblank_l; // dcc for 4:2:0 is not supported in dcn1.0.  assigned to be the same as _l for now
 
@@ -1543,7 +1543,7 @@ static void dml_rq_dlg_get_dlg_params(
 		disp_dlg_regs->refcyc_per_vm_req_flip = dml_pow(2, 23) - 1;
 
 	disp_dlg_regs->dst_y_per_pte_row_nom_l = (unsigned int) ((double) dpte_row_height_l / (double) vratio_l * dml_pow(2, 2));
-	ASSERT(disp_dlg_regs->dst_y_per_pte_row_nom_l < (unsigned int)dml_pow(2, 17));
+	ASSERT_WARN(disp_dlg_regs->dst_y_per_pte_row_nom_l < (unsigned int)dml_pow(2, 17));
 	if (dual_plane) {
 		disp_dlg_regs->dst_y_per_pte_row_nom_c = (unsigned int) ((double) dpte_row_height_c / (double) vratio_c * dml_pow(2, 2));
 		if (disp_dlg_regs->dst_y_per_pte_row_nom_c >= (unsigned int) dml_pow(2, 17)) {
@@ -1556,10 +1556,10 @@ static void dml_rq_dlg_get_dlg_params(
 	}
 
 	disp_dlg_regs->dst_y_per_meta_row_nom_l = (unsigned int) ((double) meta_row_height_l / (double) vratio_l * dml_pow(2, 2));
-	ASSERT(disp_dlg_regs->dst_y_per_meta_row_nom_l < (unsigned int)dml_pow(2, 17));
+	ASSERT_WARN(disp_dlg_regs->dst_y_per_meta_row_nom_l < (unsigned int)dml_pow(2, 17));
 
 	disp_dlg_regs->dst_y_per_meta_row_nom_c = (unsigned int) ((double) meta_row_height_c / (double) vratio_c * dml_pow(2, 2));
-	ASSERT(disp_dlg_regs->dst_y_per_meta_row_nom_c < (unsigned int)dml_pow(2, 17));
+	ASSERT_WARN(disp_dlg_regs->dst_y_per_meta_row_nom_c < (unsigned int)dml_pow(2, 17));
 
 	disp_dlg_regs->refcyc_per_pte_group_nom_l = (unsigned int) ((double) dpte_row_height_l / (double) vratio_l * (double) htotal * ref_freq_to_pix_freq
 			/ (double) dpte_groups_per_row_ub_l);
@@ -1585,11 +1585,11 @@ static void dml_rq_dlg_get_dlg_params(
 
 	disp_dlg_regs->refcyc_per_line_delivery_pre_l = (unsigned int) dml_floor(refcyc_per_line_delivery_pre_l, 1);
 	disp_dlg_regs->refcyc_per_line_delivery_l = (unsigned int) dml_floor(refcyc_per_line_delivery_l, 1);
-	ASSERT(disp_dlg_regs->refcyc_per_line_delivery_pre_l < (unsigned int)dml_pow(2, 13)); ASSERT(disp_dlg_regs->refcyc_per_line_delivery_l < (unsigned int)dml_pow(2, 13));
+	ASSERT_WARN(disp_dlg_regs->refcyc_per_line_delivery_pre_l < (unsigned int)dml_pow(2, 13)); ASSERT_WARN(disp_dlg_regs->refcyc_per_line_delivery_l < (unsigned int)dml_pow(2, 13));
 
 	disp_dlg_regs->refcyc_per_line_delivery_pre_c = (unsigned int) dml_floor(refcyc_per_line_delivery_pre_c, 1);
 	disp_dlg_regs->refcyc_per_line_delivery_c = (unsigned int) dml_floor(refcyc_per_line_delivery_c, 1);
-	ASSERT(disp_dlg_regs->refcyc_per_line_delivery_pre_c < (unsigned int)dml_pow(2, 13)); ASSERT(disp_dlg_regs->refcyc_per_line_delivery_c < (unsigned int)dml_pow(2, 13));
+	ASSERT_WARN(disp_dlg_regs->refcyc_per_line_delivery_pre_c < (unsigned int)dml_pow(2, 13)); ASSERT_WARN(disp_dlg_regs->refcyc_per_line_delivery_c < (unsigned int)dml_pow(2, 13));
 
 	disp_dlg_regs->chunk_hdl_adjust_cur0 = 3;
 	disp_dlg_regs->dst_y_offset_cur0 = 0;
@@ -1608,10 +1608,10 @@ static void dml_rq_dlg_get_dlg_params(
 	disp_ttu_regs->refcyc_per_req_delivery_cur1 = (unsigned int) (refcyc_per_req_delivery_cur1 * dml_pow(2, 10));
 
 	disp_ttu_regs->qos_level_low_wm = 0;
-	ASSERT(disp_ttu_regs->qos_level_low_wm < dml_pow(2, 14));
+	ASSERT_WARN(disp_ttu_regs->qos_level_low_wm < dml_pow(2, 14));
 
 	disp_ttu_regs->qos_level_high_wm = (unsigned int) (4.0 * (double) htotal * ref_freq_to_pix_freq);
-	ASSERT(disp_ttu_regs->qos_level_high_wm < dml_pow(2, 14));
+	ASSERT_WARN(disp_ttu_regs->qos_level_high_wm < dml_pow(2, 14));
 
 	disp_ttu_regs->qos_level_flip = 14;
 	disp_ttu_regs->qos_level_fixed_l = 8;
@@ -1622,7 +1622,7 @@ static void dml_rq_dlg_get_dlg_params(
 	disp_ttu_regs->qos_ramp_disable_cur0 = 0;
 
 	disp_ttu_regs->min_ttu_vblank = min_ttu_vblank * refclk_freq_in_mhz;
-	ASSERT(disp_ttu_regs->min_ttu_vblank < dml_pow(2, 24));
+	ASSERT_WARN(disp_ttu_regs->min_ttu_vblank < dml_pow(2, 24));
 
 	print__ttu_regs_st(mode_lib, disp_ttu_regs);
 	print__dlg_regs_st(mode_lib, disp_dlg_regs);
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
index 6f490d8d7038..11b4c5c4097f 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
@@ -305,7 +305,7 @@ int dcn32_find_dummy_latency_index_for_fw_based_mclk_switch(struct dc *dc,
 	}
 
 	if (dummy_latency_index == max_latency_table_entries) {
-		ASSERT(dummy_latency_index != max_latency_table_entries);
+		ASSERT_WARN(dummy_latency_index != max_latency_table_entries);
 		/* If the execution gets here, it means dummy p_states are
 		 * not possible. This should never happen and would mean
 		 * something is severely wrong.
@@ -1676,7 +1676,7 @@ static void dcn32_calculate_dlg_params(struct dc *dc, struct dc_state *context,
 		context->bw_ctx.bw.dcn.clk.fclk_p_state_change_support = true;
 
 	usr_retraining_support = context->bw_ctx.dml.vba.USRRetrainingSupport[vlevel][context->bw_ctx.dml.vba.maxMpcComb];
-	ASSERT(usr_retraining_support);
+	ASSERT_WARN(usr_retraining_support);
 
 	if (context->bw_ctx.bw.dcn.clk.dispclk_khz < dc->debug.min_disp_clk_khz)
 		context->bw_ctx.bw.dcn.clk.dispclk_khz = dc->debug.min_disp_clk_khz;
@@ -1685,7 +1685,7 @@ static void dcn32_calculate_dlg_params(struct dc *dc, struct dc_state *context,
 
 	if (unbounded_req_enabled && pipe_cnt > 1) {
 		// Unbounded requesting should not ever be used when more than 1 pipe is enabled.
-		ASSERT(false);
+		ASSERT_WARN(false);
 		unbounded_req_enabled = false;
 	}
 
@@ -1830,7 +1830,7 @@ static struct pipe_ctx *dcn32_find_split_pipe(
 	/*
 	 * May need to fix pipes getting tossed from 1 opp to another on flip
 	 * Add for debugging transient underflow during topology updates:
-	 * ASSERT(pipe);
+	 * ASSERT_WARN(pipe);
 	 */
 	if (!pipe)
 		for (i = dc->res_pool->pipe_count - 1; i >= 0; i--) {
@@ -1889,7 +1889,7 @@ static bool dcn32_split_stream_for_mpc_or_odm(
 	sec_pipe->stream_res.dsc = NULL;
 	if (odm) {
 		if (pri_pipe->next_odm_pipe) {
-			ASSERT(pri_pipe->next_odm_pipe != sec_pipe);
+			ASSERT_WARN(pri_pipe->next_odm_pipe != sec_pipe);
 			sec_pipe->next_odm_pipe = pri_pipe->next_odm_pipe;
 			sec_pipe->next_odm_pipe->prev_odm_pipe = sec_pipe;
 		}
@@ -1903,7 +1903,7 @@ static bool dcn32_split_stream_for_mpc_or_odm(
 		}
 		pri_pipe->next_odm_pipe = sec_pipe;
 		sec_pipe->prev_odm_pipe = pri_pipe;
-		ASSERT(sec_pipe->top_pipe == NULL);
+		ASSERT_WARN(sec_pipe->top_pipe == NULL);
 
 		if (!sec_pipe->top_pipe)
 			sec_pipe->stream_res.opp = pool->opps[pipe_idx];
@@ -1911,20 +1911,20 @@ static bool dcn32_split_stream_for_mpc_or_odm(
 			sec_pipe->stream_res.opp = sec_pipe->top_pipe->stream_res.opp;
 		if (sec_pipe->stream->timing.flags.DSC == 1) {
 			dcn20_acquire_dsc(dc, res_ctx, &sec_pipe->stream_res.dsc, pipe_idx);
-			ASSERT(sec_pipe->stream_res.dsc);
+			ASSERT_WARN(sec_pipe->stream_res.dsc);
 			if (sec_pipe->stream_res.dsc == NULL)
 				return false;
 		}
 	} else {
 		if (pri_pipe->bottom_pipe) {
-			ASSERT(pri_pipe->bottom_pipe != sec_pipe);
+			ASSERT_WARN(pri_pipe->bottom_pipe != sec_pipe);
 			sec_pipe->bottom_pipe = pri_pipe->bottom_pipe;
 			sec_pipe->bottom_pipe->top_pipe = sec_pipe;
 		}
 		pri_pipe->bottom_pipe = sec_pipe;
 		sec_pipe->top_pipe = pri_pipe;
 
-		ASSERT(pri_pipe->plane_state);
+		ASSERT_WARN(pri_pipe->plane_state);
 	}
 
 	return true;
@@ -2021,7 +2021,7 @@ static bool dcn32_apply_merge_split_flags_helper(
 				memset(&pipe->link_res, 0, sizeof(pipe->link_res));
 				*repopulate_pipes = true;
 			} else
-				ASSERT(0); /* Should never try to merge master pipe */
+				ASSERT_WARN(0); /* Should never try to merge master pipe */
 
 		}
 
@@ -2056,7 +2056,7 @@ static bool dcn32_apply_merge_split_flags_helper(
 						old_index = old_pipe->bottom_pipe->pipe_idx;
 				}
 				hsplit_pipe = dcn32_find_split_pipe(dc, context, old_index);
-				ASSERT(hsplit_pipe);
+				ASSERT_WARN(hsplit_pipe);
 				if (!hsplit_pipe)
 					return false;
 
@@ -2079,7 +2079,7 @@ static bool dcn32_apply_merge_split_flags_helper(
 				else
 					old_index = -1;
 				pipe_4to1 = dcn32_find_split_pipe(dc, context, old_index);
-				ASSERT(pipe_4to1);
+				ASSERT_WARN(pipe_4to1);
 				if (!pipe_4to1)
 					return false;
 				if (!dcn32_split_stream_for_mpc_or_odm(
@@ -2098,7 +2098,7 @@ static bool dcn32_apply_merge_split_flags_helper(
 				else
 					old_index = -1;
 				pipe_4to1 = dcn32_find_split_pipe(dc, context, old_index);
-				ASSERT(pipe_4to1);
+				ASSERT_WARN(pipe_4to1);
 				if (!pipe_4to1)
 					return false;
 				if (!dcn32_split_stream_for_mpc_or_odm(
@@ -2148,7 +2148,7 @@ bool dcn32_internal_validate_bw(struct dc *dc,
 
 	dc_assert_fp_enabled();
 
-	ASSERT(pipes);
+	ASSERT_WARN(pipes);
 	if (!pipes)
 		return false;
 
@@ -2225,7 +2225,7 @@ bool dcn32_internal_validate_bw(struct dc *dc,
 				&& memcmp(&mpo_pipe->plane_state->clip_rect,
 						&pipe->stream->src,
 						sizeof(struct rect)) != 0) {
-			ASSERT(mpo_pipe->plane_state != pipe->plane_state);
+			ASSERT_WARN(mpo_pipe->plane_state != pipe->plane_state);
 			goto validate_fail;
 		}
 		pipe_idx++;
@@ -3253,7 +3253,7 @@ void dcn32_update_bw_bounding_box_fpu(struct dc *dc, struct clk_bw_params *bw_pa
 			 * DC__VOLTAGE_STATES is 40.
 			 */
 			if (num_states > MAX_NUM_DPM_LVL) {
-				ASSERT(0);
+				ASSERT_WARN(0);
 				return;
 			}
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_rq_dlg_calc_32.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_rq_dlg_calc_32.c
index 9ba6cb67655f..3ac5fe3aadc0 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_rq_dlg_calc_32.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_rq_dlg_calc_32.c
@@ -132,7 +132,7 @@ void dml32_rq_dlg_get_rq_reg(display_rq_regs_st *rq_regs,
 			pipe_idx);
 
 	if (src->sw_mode == dm_sw_linear)
-		ASSERT(pte_row_height_linear >= 8);
+		ASSERT_WARN(pte_row_height_linear >= 8);
 
 	rq_regs->rq_regs_l.pte_row_height_linear = dml_floor(dml_log2(pte_row_height_linear), 1) - 3;
 
@@ -141,7 +141,7 @@ void dml32_rq_dlg_get_rq_reg(display_rq_regs_st *rq_regs,
 				num_pipes, pipe_idx);
 		;
 		if (src->sw_mode == dm_sw_linear)
-			ASSERT(p1_pte_row_height_linear >= 8);
+			ASSERT_WARN(p1_pte_row_height_linear >= 8);
 
 		rq_regs->rq_regs_c.pte_row_height_linear = dml_floor(dml_log2(p1_pte_row_height_linear), 1) - 3;
 	}
@@ -270,7 +270,7 @@ void dml32_rq_dlg_get_dlg_reg(struct display_mode_lib *mode_lib,
 	dml_print("DML_DLG: %s: pclk_freq_in_mhz = %3.2f\n", __func__, pclk_freq_in_mhz);
 	dml_print("DML_DLG: %s: ref_freq_to_pix_freq   = %3.2f\n", __func__, ref_freq_to_pix_freq);
 	dml_print("DML_DLG: %s: interlaced = %d\n", __func__, interlaced);
-	ASSERT(ref_freq_to_pix_freq < 4.0);
+	ASSERT_WARN(ref_freq_to_pix_freq < 4.0);
 
 	dlg_regs->ref_freq_to_pix_freq = (unsigned int) (ref_freq_to_pix_freq * dml_pow(2, 19));
 	dlg_regs->refcyc_per_htotal = (unsigned int) (ref_freq_to_pix_freq * (double) htotal * dml_pow(2, 8));
@@ -342,7 +342,7 @@ void dml32_rq_dlg_get_dlg_reg(struct display_mode_lib *mode_lib,
 				+ odm_pipe_index * (double) dst->hactive / odm_combine_factor) * ref_freq_to_pix_freq);
 		}
 	}
-	ASSERT(dlg_regs->refcyc_h_blank_end < (unsigned int)dml_pow(2, 13));
+	ASSERT_WARN(dlg_regs->refcyc_h_blank_end < (unsigned int)dml_pow(2, 13));
 
 	dml_print("DML_DLG: %s: htotal= %d\n", __func__, htotal);
 	dml_print("DML_DLG: %s: dst_x_after_scaler[%d]= %d\n", __func__, pipe_idx, dst_x_after_scaler);
@@ -368,9 +368,9 @@ void dml32_rq_dlg_get_dlg_reg(struct display_mode_lib *mode_lib,
 	dml_print("DML_DLG: %s: dst_y_per_vm_vblank  = %3.2f\n", __func__, dst_y_per_vm_vblank);
 	dml_print("DML_DLG: %s: dst_y_per_row_vblank = %3.2f\n", __func__, dst_y_per_row_vblank);
 
-	ASSERT(dst_y_per_vm_vblank < max_dst_y_per_vm_vblank);
-	ASSERT(dst_y_per_row_vblank < max_dst_y_per_row_vblank);
-	ASSERT(dst_y_prefetch > (dst_y_per_vm_vblank + dst_y_per_row_vblank));
+	ASSERT_WARN(dst_y_per_vm_vblank < max_dst_y_per_vm_vblank);
+	ASSERT_WARN(dst_y_per_row_vblank < max_dst_y_per_row_vblank);
+	ASSERT_WARN(dst_y_prefetch > (dst_y_per_vm_vblank + dst_y_per_row_vblank));
 
 	vratio_pre_l = get_vratio_prefetch_l(mode_lib, e2e_pipe_param, num_pipes, pipe_idx);    // From VBA
 	vratio_pre_c = get_vratio_prefetch_c(mode_lib, e2e_pipe_param, num_pipes, pipe_idx);    // From VBA
@@ -424,7 +424,7 @@ void dml32_rq_dlg_get_dlg_reg(struct display_mode_lib *mode_lib,
 	}
 
 	// TTU - Cursor
-	ASSERT(src->num_cursors <= 1);
+	ASSERT_WARN(src->num_cursors <= 1);
 	if (src->num_cursors > 0) {
 		refcyc_per_req_delivery_pre_cur0 = get_refcyc_per_cursor_req_delivery_pre_in_us(mode_lib,
 				e2e_pipe_param, num_pipes, pipe_idx) * refclk_freq_in_mhz;  // From VBA
@@ -439,7 +439,7 @@ void dml32_rq_dlg_get_dlg_reg(struct display_mode_lib *mode_lib,
 
 	// Assign to register structures
 	dlg_regs->min_dst_y_next_start = min_dst_y_next_start * dml_pow(2, 2);
-	ASSERT(dlg_regs->min_dst_y_next_start < (unsigned int)dml_pow(2, 18));
+	ASSERT_WARN(dlg_regs->min_dst_y_next_start < (unsigned int)dml_pow(2, 18));
 
 	dlg_regs->dst_y_after_scaler = dst_y_after_scaler; // in terms of line
 	dlg_regs->refcyc_x_after_scaler = dst_x_after_scaler * ref_freq_to_pix_freq; // in terms of refclk
@@ -552,10 +552,10 @@ void dml32_rq_dlg_get_dlg_reg(struct display_mode_lib *mode_lib,
 	ttu_regs->min_ttu_vblank = min_ttu_vblank * refclk_freq_in_mhz;
 
 	// CHECK for HW registers' range, assert or clamp
-	ASSERT(refcyc_per_req_delivery_pre_l < dml_pow(2, 13));
-	ASSERT(refcyc_per_req_delivery_l < dml_pow(2, 13));
-	ASSERT(refcyc_per_req_delivery_pre_c < dml_pow(2, 13));
-	ASSERT(refcyc_per_req_delivery_c < dml_pow(2, 13));
+	ASSERT_WARN(refcyc_per_req_delivery_pre_l < dml_pow(2, 13));
+	ASSERT_WARN(refcyc_per_req_delivery_l < dml_pow(2, 13));
+	ASSERT_WARN(refcyc_per_req_delivery_pre_c < dml_pow(2, 13));
+	ASSERT_WARN(refcyc_per_req_delivery_c < dml_pow(2, 13));
 	if (dlg_regs->refcyc_per_vm_group_vblank >= (unsigned int) dml_pow(2, 23))
 		dlg_regs->refcyc_per_vm_group_vblank = dml_pow(2, 23) - 1;
 
@@ -568,9 +568,9 @@ void dml32_rq_dlg_get_dlg_reg(struct display_mode_lib *mode_lib,
 	if (dlg_regs->refcyc_per_vm_req_flip >= (unsigned int) dml_pow(2, 23))
 		dlg_regs->refcyc_per_vm_req_flip = dml_pow(2, 23) - 1;
 
-	ASSERT(dlg_regs->dst_y_after_scaler < (unsigned int) 8);
-	ASSERT(dlg_regs->refcyc_x_after_scaler < (unsigned int)dml_pow(2, 13));
-	ASSERT(dlg_regs->dst_y_per_pte_row_nom_l < (unsigned int)dml_pow(2, 17));
+	ASSERT_WARN(dlg_regs->dst_y_after_scaler < (unsigned int) 8);
+	ASSERT_WARN(dlg_regs->refcyc_x_after_scaler < (unsigned int)dml_pow(2, 13));
+	ASSERT_WARN(dlg_regs->dst_y_per_pte_row_nom_l < (unsigned int)dml_pow(2, 17));
 	if (dual_plane) {
 		if (dlg_regs->dst_y_per_pte_row_nom_c >= (unsigned int) dml_pow(2, 17)) {
 			// FIXME what so special about chroma, can we just assert?
@@ -578,8 +578,8 @@ void dml32_rq_dlg_get_dlg_reg(struct display_mode_lib *mode_lib,
 					__func__, dlg_regs->dst_y_per_pte_row_nom_c, (unsigned int)dml_pow(2, 17) - 1);
 		}
 	}
-	ASSERT(dlg_regs->dst_y_per_meta_row_nom_l < (unsigned int)dml_pow(2, 17));
-	ASSERT(dlg_regs->dst_y_per_meta_row_nom_c < (unsigned int)dml_pow(2, 17));
+	ASSERT_WARN(dlg_regs->dst_y_per_meta_row_nom_l < (unsigned int)dml_pow(2, 17));
+	ASSERT_WARN(dlg_regs->dst_y_per_meta_row_nom_c < (unsigned int)dml_pow(2, 17));
 
 	if (dlg_regs->refcyc_per_pte_group_nom_l >= (unsigned int) dml_pow(2, 23))
 		dlg_regs->refcyc_per_pte_group_nom_l = dml_pow(2, 23) - 1;
@@ -587,9 +587,9 @@ void dml32_rq_dlg_get_dlg_reg(struct display_mode_lib *mode_lib,
 		if (dlg_regs->refcyc_per_pte_group_nom_c >= (unsigned int) dml_pow(2, 23))
 			dlg_regs->refcyc_per_pte_group_nom_c = dml_pow(2, 23) - 1;
 	}
-	ASSERT(dlg_regs->refcyc_per_pte_group_vblank_l < (unsigned int)dml_pow(2, 13));
+	ASSERT_WARN(dlg_regs->refcyc_per_pte_group_vblank_l < (unsigned int)dml_pow(2, 13));
 	if (dual_plane) {
-		ASSERT(dlg_regs->refcyc_per_pte_group_vblank_c < (unsigned int)dml_pow(2, 13));
+		ASSERT_WARN(dlg_regs->refcyc_per_pte_group_vblank_c < (unsigned int)dml_pow(2, 13));
 	}
 
 	if (dlg_regs->refcyc_per_meta_chunk_nom_l >= (unsigned int) dml_pow(2, 23))
@@ -598,15 +598,15 @@ void dml32_rq_dlg_get_dlg_reg(struct display_mode_lib *mode_lib,
 		if (dlg_regs->refcyc_per_meta_chunk_nom_c >= (unsigned int) dml_pow(2, 23))
 			dlg_regs->refcyc_per_meta_chunk_nom_c = dml_pow(2, 23) - 1;
 	}
-	ASSERT(dlg_regs->refcyc_per_meta_chunk_vblank_l < (unsigned int)dml_pow(2, 13));
-	ASSERT(dlg_regs->refcyc_per_meta_chunk_vblank_c < (unsigned int)dml_pow(2, 13));
-	ASSERT(dlg_regs->refcyc_per_line_delivery_pre_l < (unsigned int)dml_pow(2, 13));
-	ASSERT(dlg_regs->refcyc_per_line_delivery_l < (unsigned int)dml_pow(2, 13));
-	ASSERT(dlg_regs->refcyc_per_line_delivery_pre_c < (unsigned int)dml_pow(2, 13));
-	ASSERT(dlg_regs->refcyc_per_line_delivery_c < (unsigned int)dml_pow(2, 13));
-	ASSERT(ttu_regs->qos_level_low_wm < dml_pow(2, 14));
-	ASSERT(ttu_regs->qos_level_high_wm < dml_pow(2, 14));
-	ASSERT(ttu_regs->min_ttu_vblank < dml_pow(2, 24));
+	ASSERT_WARN(dlg_regs->refcyc_per_meta_chunk_vblank_l < (unsigned int)dml_pow(2, 13));
+	ASSERT_WARN(dlg_regs->refcyc_per_meta_chunk_vblank_c < (unsigned int)dml_pow(2, 13));
+	ASSERT_WARN(dlg_regs->refcyc_per_line_delivery_pre_l < (unsigned int)dml_pow(2, 13));
+	ASSERT_WARN(dlg_regs->refcyc_per_line_delivery_l < (unsigned int)dml_pow(2, 13));
+	ASSERT_WARN(dlg_regs->refcyc_per_line_delivery_pre_c < (unsigned int)dml_pow(2, 13));
+	ASSERT_WARN(dlg_regs->refcyc_per_line_delivery_c < (unsigned int)dml_pow(2, 13));
+	ASSERT_WARN(ttu_regs->qos_level_low_wm < dml_pow(2, 14));
+	ASSERT_WARN(ttu_regs->qos_level_high_wm < dml_pow(2, 14));
+	ASSERT_WARN(ttu_regs->min_ttu_vblank < dml_pow(2, 24));
 
 	print__ttu_regs_st(mode_lib, ttu_regs);
 	print__dlg_regs_st(mode_lib, dlg_regs);
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c
index 8839faf42207..4fd4e51a273c 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c
@@ -809,7 +809,7 @@ void dcn321_update_bw_bounding_box_fpu(struct dc *dc, struct clk_bw_params *bw_p
 		 * DC__VOLTAGE_STATES is 40.
 		 */
 		if (num_states > MAX_NUM_DPM_LVL) {
-			ASSERT(0);
+			ASSERT_WARN(0);
 			return;
 		}
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c
index beed7adbbd43..280b8887ce58 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c
@@ -241,7 +241,7 @@ void dcn35_update_bw_bounding_box_fpu(struct dc *dc,
 	dcn3_5_ip.max_num_dpp = dc->res_pool->pipe_count;
 	dcn3_5_soc.num_chans = bw_params->num_channels;
 
-	ASSERT(clk_table->num_entries);
+	ASSERT_WARN(clk_table->num_entries);
 
 	/* Prepass to find max clocks independent of voltage level. */
 	for (i = 0; i < clk_table->num_entries; ++i) {
@@ -517,7 +517,7 @@ int dcn35_populate_dml_pipes_from_context_fpu(struct dc *dc,
 				pipes[pipe_cnt].dout.dsc_input_bpc = 12;
 				break;
 			default:
-				ASSERT(0);
+				ASSERT_WARN(0);
 				break;
 			}
 		}
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c
index d9e63c4fdd95..f8b4097727cc 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn351/dcn351_fpu.c
@@ -275,7 +275,7 @@ void dcn351_update_bw_bounding_box_fpu(struct dc *dc,
 	dcn3_51_ip.max_num_dpp = dc->res_pool->pipe_count;
 	dcn3_51_soc.num_chans = bw_params->num_channels;
 
-	ASSERT(clk_table->num_entries);
+	ASSERT_WARN(clk_table->num_entries);
 
 	/* Prepass to find max clocks independent of voltage level. */
 	for (i = 0; i < clk_table->num_entries; ++i) {
@@ -551,7 +551,7 @@ int dcn351_populate_dml_pipes_from_context_fpu(struct dc *dc,
 				pipes[pipe_cnt].dout.dsc_input_bpc = 12;
 				break;
 			default:
-				ASSERT(0);
+				ASSERT_WARN(0);
 				break;
 			}
 		}
diff --git a/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.c b/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.c
index 85453bbb4f9b..0cb43493b8fc 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.c
@@ -258,7 +258,7 @@ static unsigned int get_pipe_idx(struct display_mode_lib *mode_lib, unsigned int
 	int pipe_idx = -1;
 	int i;
 
-	ASSERT(plane_idx < DC__NUM_DPP__MAX);
+	ASSERT_WARN(plane_idx < DC__NUM_DPP__MAX);
 
 	for (i = 0; i < DC__NUM_DPP__MAX ; i++) {
 		if (plane_idx == mode_lib->vba.pipe_plane[i]) {
@@ -266,7 +266,7 @@ static unsigned int get_pipe_idx(struct display_mode_lib *mode_lib, unsigned int
 			break;
 		}
 	}
-	ASSERT(pipe_idx >= 0);
+	ASSERT_WARN(pipe_idx >= 0);
 
 	return pipe_idx;
 }
@@ -870,7 +870,7 @@ static void fetch_pipe_params(struct display_mode_lib *mode_lib)
 	// Do we want the dscclk to automatically be halved? Guess not since the value is specified
 	mode_lib->vba.SynchronizedVBlank = pipes[0].pipe.dest.synchronized_vblank_all_planes;
 	for (k = 1; k < mode_lib->vba.cache_num_pipes; ++k) {
-		ASSERT(mode_lib->vba.SynchronizedVBlank == pipes[k].pipe.dest.synchronized_vblank_all_planes);
+		ASSERT_WARN(mode_lib->vba.SynchronizedVBlank == pipes[k].pipe.dest.synchronized_vblank_all_planes);
 	}
 
 	mode_lib->vba.GPUVMEnable = false;
@@ -926,7 +926,7 @@ static void fetch_pipe_params(struct display_mode_lib *mode_lib)
 				dml_print("DML::%s:  -  UseMALLForStaticScreen  = %d\n",
 						__func__, (int) mode_lib->vba.UseMALLForStaticScreen[k]);
 #endif
-				ASSERT(0);
+				ASSERT_WARN(0);
 			}
 		}
 	}
@@ -1101,7 +1101,7 @@ void ModeSupportAndSystemConfiguration(struct display_mode_lib *mode_lib)
 	for (k = 0; k < mode_lib->vba.NumberOfActivePlanes; ++k) {
 		pipe_idx = get_pipe_idx(mode_lib, k);
 		if (pipe_idx == -1) {
-			ASSERT(0);
+			ASSERT_WARN(0);
 			continue; // skip inactive planes
 		}
 		total_pipes += mode_lib->vba.DPPPerPlane[k];
@@ -1111,7 +1111,7 @@ void ModeSupportAndSystemConfiguration(struct display_mode_lib *mode_lib)
 		else
 			mode_lib->vba.DPPCLK[k] = soc->clock_limits[mode_lib->vba.VoltageLevel].dppclk_mhz;
 	}
-	ASSERT(total_pipes <= DC__NUM_DPP__MAX);
+	ASSERT_WARN(total_pipes <= DC__NUM_DPP__MAX);
 }
 
 double CalculateWriteBackDISPCLK(
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dml1_display_rq_dlg_calc.c b/drivers/gpu/drm/amd/display/dc/dml/dml1_display_rq_dlg_calc.c
index 88dc2b97e7bf..ad2ef4892b41 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dml1_display_rq_dlg_calc.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dml1_display_rq_dlg_calc.c
@@ -180,7 +180,7 @@ static void get_swath_need(
 	DTRACE("DLG: %s: swath_height      = %0d", __func__, swath_height);
 	DTRACE("DLG: %s: vinit             = %3.2f", __func__, vinit);
 
-	ASSERT(prefill > 0.0 && prefill <= 8.0);
+	ASSERT_WARN(prefill > 0.0 && prefill <= 8.0);
 
 	*max_num_sw = (unsigned int) (dml_ceil((prefill - 1.0) / (double) swath_height, 1) + 1.0); /* prefill has to be >= 1 */
 	max_partial_sw_int =
@@ -504,7 +504,7 @@ static void dml1_rq_dlg_get_row_heights(
 		log2_dpte_req_height_ptes = log2_blk_height - log2_vmpg_height;
 	log2_dpte_req_width_ptes = 3 - log2_dpte_req_height_ptes;
 
-	ASSERT((log2_dpte_req_width_ptes == 3 && log2_dpte_req_height_ptes == 0) || /* 8x1 */
+	ASSERT_WARN((log2_dpte_req_width_ptes == 3 && log2_dpte_req_height_ptes == 0) || /* 8x1 */
 			(log2_dpte_req_width_ptes == 2 && log2_dpte_req_height_ptes == 1) || /* 4x2 */
 			(log2_dpte_req_width_ptes == 1 && log2_dpte_req_height_ptes == 2)); /* 2x4 */
 
@@ -523,7 +523,7 @@ static void dml1_rq_dlg_get_row_heights(
 				dml_log2(dpte_buf_in_pte_reqs * dpte_req_width / data_pitch),
 				1);
 
-		ASSERT(log2_dpte_row_height_linear >= 3);
+		ASSERT_WARN(log2_dpte_row_height_linear >= 3);
 
 		if (log2_dpte_row_height_linear > 7)
 			log2_dpte_row_height_linear = 7;
@@ -828,7 +828,7 @@ static void get_surf_rq_param(
 	log2_dpte_req_width_ptes = 3 - log2_dpte_req_height_ptes;
 
 	/* Ensure we only have the 3 shapes */
-	ASSERT((log2_dpte_req_width_ptes == 3 && log2_dpte_req_height_ptes == 0) || /* 8x1 */
+	ASSERT_WARN((log2_dpte_req_width_ptes == 3 && log2_dpte_req_height_ptes == 0) || /* 8x1 */
 			(log2_dpte_req_width_ptes == 2 && log2_dpte_req_height_ptes == 1) || /* 4x2 */
 			(log2_dpte_req_width_ptes == 1 && log2_dpte_req_height_ptes == 2)); /* 2x4 */
 
@@ -849,7 +849,7 @@ static void get_surf_rq_param(
 				dml_log2(dpte_buf_in_pte_reqs * dpte_req_width / data_pitch),
 				1);
 
-		ASSERT(log2_dpte_row_height_linear >= 3);
+		ASSERT_WARN(log2_dpte_row_height_linear >= 3);
 
 		if (log2_dpte_row_height_linear > 7)
 			log2_dpte_row_height_linear = 7;
@@ -944,7 +944,7 @@ static void get_surf_rq_param(
 				"MISMATCH: rq_dlg_param->meta_row_height = %d",
 				rq_dlg_param->meta_row_height);
 		DTRACE("MISMATCH: func_meta_row_height = %d", func_meta_row_height);
-		ASSERT(0);
+		ASSERT_WARN(0);
 	}
 
 	if (rq_dlg_param->dpte_row_height != func_dpte_row_height) {
@@ -952,7 +952,7 @@ static void get_surf_rq_param(
 				"MISMATCH: rq_dlg_param->dpte_row_height = %d",
 				rq_dlg_param->dpte_row_height);
 		DTRACE("MISMATCH: func_dpte_row_height = %d", func_dpte_row_height);
-		ASSERT(0);
+		ASSERT_WARN(0);
 	}
 }
 
@@ -1148,14 +1148,14 @@ void dml1_rq_dlg_get_dlg_params(
 	DTRACE("DLG: %s: interlaced             = %d", __func__, interlaced);
 
 	ref_freq_to_pix_freq = refclk_freq_in_mhz / pclk_freq_in_mhz;
-	ASSERT(ref_freq_to_pix_freq < 4.0);
+	ASSERT_WARN(ref_freq_to_pix_freq < 4.0);
 	disp_dlg_regs->ref_freq_to_pix_freq =
 			(unsigned int) (ref_freq_to_pix_freq * dml_pow(2, 19));
 	disp_dlg_regs->refcyc_per_htotal = (unsigned int) (ref_freq_to_pix_freq * (double) htotal
 			* dml_pow(2, 8));
 	disp_dlg_regs->refcyc_h_blank_end = (unsigned int) ((double) hblank_end
 			* (double) ref_freq_to_pix_freq);
-	ASSERT(disp_dlg_regs->refcyc_h_blank_end < (unsigned int) dml_pow(2, 13));
+	ASSERT_WARN(disp_dlg_regs->refcyc_h_blank_end < (unsigned int) dml_pow(2, 13));
 	disp_dlg_regs->dlg_vblank_end = interlaced ? (vblank_end / 2) : vblank_end; /* 15 bits */
 
 	prefetch_xy_calc_in_dcfclk = 24.0; /* TODO: ip_param */
@@ -1173,7 +1173,7 @@ void dml1_rq_dlg_get_dlg_params(
 
 	disp_dlg_regs->min_dst_y_next_start = (unsigned int) (((double) dlg_vblank_start
 			+ min_dst_y_ttu_vblank) * dml_pow(2, 2));
-	ASSERT(disp_dlg_regs->min_dst_y_next_start < (unsigned int) dml_pow(2, 18));
+	ASSERT_WARN(disp_dlg_regs->min_dst_y_next_start < (unsigned int) dml_pow(2, 18));
 
 	DTRACE("DLG: %s: min_dcfclk_mhz                         = %3.2f", __func__, min_dcfclk_mhz);
 	DTRACE("DLG: %s: min_ttu_vblank                         = %3.2f", __func__, min_ttu_vblank);
@@ -1343,7 +1343,7 @@ void dml1_rq_dlg_get_dlg_params(
 	dst_y_prefetch = ((double) min_vblank - 1.0)
 			- (line_setup + line_calc + line_wait + line_o);
 	DTRACE("DLG: %s: dst_y_prefetch (before rnd) = %3.2f", __func__, dst_y_prefetch);
-	ASSERT(dst_y_prefetch >= 2.0);
+	ASSERT_WARN(dst_y_prefetch >= 2.0);
 
 	dst_y_prefetch = dml_floor(4.0 * (dst_y_prefetch + 0.125), 1) / 4;
 	DTRACE("DLG: %s: dst_y_prefetch (after rnd) = %3.2f", __func__, dst_y_prefetch);
@@ -1437,7 +1437,7 @@ void dml1_rq_dlg_get_dlg_params(
 
 	disp_dlg_regs->dst_y_after_scaler = dst_y_after_scaler; /* in terms of line */
 	disp_dlg_regs->refcyc_x_after_scaler = dst_x_after_scaler * ref_freq_to_pix_freq; /* in terms of refclk */
-	ASSERT(disp_dlg_regs->refcyc_x_after_scaler < (unsigned int) dml_pow(2, 13));
+	ASSERT_WARN(disp_dlg_regs->refcyc_x_after_scaler < (unsigned int) dml_pow(2, 13));
 	DTRACE(
 			"DLG: %s: disp_dlg_regs->dst_y_after_scaler      = 0x%0x",
 			__func__,
@@ -1486,10 +1486,10 @@ void dml1_rq_dlg_get_dlg_params(
 		min_dst_y_per_row_vblank = 100.0;
 	}
 
-	ASSERT(dst_y_per_vm_vblank < min_dst_y_per_vm_vblank);
-	ASSERT(dst_y_per_row_vblank < min_dst_y_per_row_vblank);
+	ASSERT_WARN(dst_y_per_vm_vblank < min_dst_y_per_vm_vblank);
+	ASSERT_WARN(dst_y_per_row_vblank < min_dst_y_per_row_vblank);
 
-	ASSERT(dst_y_prefetch > (dst_y_per_vm_vblank + dst_y_per_row_vblank));
+	ASSERT_WARN(dst_y_prefetch > (dst_y_per_vm_vblank + dst_y_per_row_vblank));
 	lsw = dst_y_prefetch - (dst_y_per_vm_vblank + dst_y_per_row_vblank);
 
 	DTRACE("DLG: %s: lsw = %3.2f", __func__, lsw);
@@ -1514,13 +1514,13 @@ void dml1_rq_dlg_get_dlg_params(
 	DTRACE("DLG: %s: vratio_pre_l=%3.2f", __func__, vratio_pre_l);
 	DTRACE("DLG: %s: vratio_pre_c=%3.2f", __func__, vratio_pre_c);
 
-	ASSERT(vratio_pre_l <= 4.0);
+	ASSERT_WARN(vratio_pre_l <= 4.0);
 	if (vratio_pre_l >= 4.0)
 		disp_dlg_regs->vratio_prefetch = (unsigned int) dml_pow(2, 21) - 1;
 	else
 		disp_dlg_regs->vratio_prefetch = (unsigned int) (vratio_pre_l * dml_pow(2, 19));
 
-	ASSERT(vratio_pre_c <= 4.0);
+	ASSERT_WARN(vratio_pre_c <= 4.0);
 	if (vratio_pre_c >= 4.0)
 		disp_dlg_regs->vratio_prefetch_c = (unsigned int) dml_pow(2, 21) - 1;
 	else
@@ -1529,17 +1529,17 @@ void dml1_rq_dlg_get_dlg_params(
 	disp_dlg_regs->refcyc_per_pte_group_vblank_l =
 			(unsigned int) (dst_y_per_row_vblank * (double) htotal
 					* ref_freq_to_pix_freq / (double) dpte_groups_per_row_ub_l);
-	ASSERT(disp_dlg_regs->refcyc_per_pte_group_vblank_l < (unsigned int) dml_pow(2, 13));
+	ASSERT_WARN(disp_dlg_regs->refcyc_per_pte_group_vblank_l < (unsigned int) dml_pow(2, 13));
 
 	disp_dlg_regs->refcyc_per_pte_group_vblank_c =
 			(unsigned int) (dst_y_per_row_vblank * (double) htotal
 					* ref_freq_to_pix_freq / (double) dpte_groups_per_row_ub_c);
-	ASSERT(disp_dlg_regs->refcyc_per_pte_group_vblank_c < (unsigned int) dml_pow(2, 13));
+	ASSERT_WARN(disp_dlg_regs->refcyc_per_pte_group_vblank_c < (unsigned int) dml_pow(2, 13));
 
 	disp_dlg_regs->refcyc_per_meta_chunk_vblank_l =
 			(unsigned int) (dst_y_per_row_vblank * (double) htotal
 					* ref_freq_to_pix_freq / (double) meta_chunks_per_row_ub_l);
-	ASSERT(disp_dlg_regs->refcyc_per_meta_chunk_vblank_l < (unsigned int) dml_pow(2, 13));
+	ASSERT_WARN(disp_dlg_regs->refcyc_per_meta_chunk_vblank_l < (unsigned int) dml_pow(2, 13));
 
 	disp_dlg_regs->refcyc_per_meta_chunk_vblank_c =
 			disp_dlg_regs->refcyc_per_meta_chunk_vblank_l;/* dcc for 4:2:0 is not supported in dcn1.0.  assigned to be the same as _l for now */
@@ -1557,15 +1557,15 @@ void dml1_rq_dlg_get_dlg_params(
 
 	disp_dlg_regs->dst_y_per_pte_row_nom_l = (unsigned int) ((double) dpte_row_height_l
 			/ (double) vratio_l * dml_pow(2, 2));
-	ASSERT(disp_dlg_regs->dst_y_per_pte_row_nom_l < (unsigned int) dml_pow(2, 17));
+	ASSERT_WARN(disp_dlg_regs->dst_y_per_pte_row_nom_l < (unsigned int) dml_pow(2, 17));
 
 	disp_dlg_regs->dst_y_per_pte_row_nom_c = (unsigned int) ((double) dpte_row_height_c
 			/ (double) vratio_c * dml_pow(2, 2));
-	ASSERT(disp_dlg_regs->dst_y_per_pte_row_nom_c < (unsigned int) dml_pow(2, 17));
+	ASSERT_WARN(disp_dlg_regs->dst_y_per_pte_row_nom_c < (unsigned int) dml_pow(2, 17));
 
 	disp_dlg_regs->dst_y_per_meta_row_nom_l = (unsigned int) ((double) meta_row_height_l
 			/ (double) vratio_l * dml_pow(2, 2));
-	ASSERT(disp_dlg_regs->dst_y_per_meta_row_nom_l < (unsigned int) dml_pow(2, 17));
+	ASSERT_WARN(disp_dlg_regs->dst_y_per_meta_row_nom_l < (unsigned int) dml_pow(2, 17));
 
 	disp_dlg_regs->dst_y_per_meta_row_nom_c = disp_dlg_regs->dst_y_per_meta_row_nom_l; /* dcc for 4:2:0 is not supported in dcn1.0.  assigned to be the same as _l for now */
 
@@ -1686,8 +1686,8 @@ void dml1_rq_dlg_get_dlg_params(
 	disp_dlg_regs->refcyc_per_line_delivery_l = (unsigned int) dml_floor(
 			refcyc_per_line_delivery_l,
 			1);
-	ASSERT(disp_dlg_regs->refcyc_per_line_delivery_pre_l < (unsigned int) dml_pow(2, 13));
-	ASSERT(disp_dlg_regs->refcyc_per_line_delivery_l < (unsigned int) dml_pow(2, 13));
+	ASSERT_WARN(disp_dlg_regs->refcyc_per_line_delivery_pre_l < (unsigned int) dml_pow(2, 13));
+	ASSERT_WARN(disp_dlg_regs->refcyc_per_line_delivery_l < (unsigned int) dml_pow(2, 13));
 
 	if (dual_plane) {
 		refcyc_per_line_delivery_pre_c = get_refcyc_per_delivery(
@@ -1725,8 +1725,8 @@ void dml1_rq_dlg_get_dlg_params(
 		disp_dlg_regs->refcyc_per_line_delivery_c = (unsigned int) dml_floor(
 				refcyc_per_line_delivery_c,
 				1);
-		ASSERT(disp_dlg_regs->refcyc_per_line_delivery_pre_c < (unsigned int) dml_pow(2, 13));
-		ASSERT(disp_dlg_regs->refcyc_per_line_delivery_c < (unsigned int) dml_pow(2, 13));
+		ASSERT_WARN(disp_dlg_regs->refcyc_per_line_delivery_pre_c < (unsigned int) dml_pow(2, 13));
+		ASSERT_WARN(disp_dlg_regs->refcyc_per_line_delivery_c < (unsigned int) dml_pow(2, 13));
 	}
 	disp_dlg_regs->chunk_hdl_adjust_cur0 = 3;
 
@@ -1772,8 +1772,8 @@ void dml1_rq_dlg_get_dlg_params(
 	disp_ttu_regs->refcyc_per_req_delivery_l = (unsigned int) (refcyc_per_req_delivery_l
 			* dml_pow(2, 10));
 
-	ASSERT(refcyc_per_req_delivery_pre_l < dml_pow(2, 13));
-	ASSERT(refcyc_per_req_delivery_l < dml_pow(2, 13));
+	ASSERT_WARN(refcyc_per_req_delivery_pre_l < dml_pow(2, 13));
+	ASSERT_WARN(refcyc_per_req_delivery_l < dml_pow(2, 13));
 
 	if (dual_plane) {
 		refcyc_per_req_delivery_pre_c = get_refcyc_per_delivery(
@@ -1809,8 +1809,8 @@ void dml1_rq_dlg_get_dlg_params(
 		disp_ttu_regs->refcyc_per_req_delivery_c = (unsigned int) (refcyc_per_req_delivery_c
 				* dml_pow(2, 10));
 
-		ASSERT(refcyc_per_req_delivery_pre_c < dml_pow(2, 13));
-		ASSERT(refcyc_per_req_delivery_c < dml_pow(2, 13));
+		ASSERT_WARN(refcyc_per_req_delivery_pre_c < dml_pow(2, 13));
+		ASSERT_WARN(refcyc_per_req_delivery_c < dml_pow(2, 13));
 	}
 
 	/* TTU - Cursor */
@@ -1823,7 +1823,7 @@ void dml1_rq_dlg_get_dlg_params(
 	cur0_req_per_width = 0.0;
 	hactive_cur0 = 0.0;
 
-	ASSERT(cur0_src_width <= 256);
+	ASSERT_WARN(cur0_src_width <= 256);
 
 	if (cur0_src_width > 0) {
 		unsigned int cur0_bit_per_pixel = 0;
@@ -1858,7 +1858,7 @@ void dml1_rq_dlg_get_dlg_params(
 
 		disp_ttu_regs->refcyc_per_req_delivery_pre_cur0 =
 				(unsigned int) (refcyc_per_req_delivery_pre_cur0 * dml_pow(2, 10));
-		ASSERT(refcyc_per_req_delivery_pre_cur0 < dml_pow(2, 13));
+		ASSERT_WARN(refcyc_per_req_delivery_pre_cur0 < dml_pow(2, 13));
 
 		if (vratio_l <= 1.0) {
 			refcyc_per_req_delivery_cur0 = hactive_cur0 * ref_freq_to_pix_freq
@@ -1893,7 +1893,7 @@ void dml1_rq_dlg_get_dlg_params(
 
 		disp_ttu_regs->refcyc_per_req_delivery_cur0 =
 				(unsigned int) (refcyc_per_req_delivery_cur0 * dml_pow(2, 10));
-		ASSERT(refcyc_per_req_delivery_cur0 < dml_pow(2, 13));
+		ASSERT_WARN(refcyc_per_req_delivery_cur0 < dml_pow(2, 13));
 	} else {
 		disp_ttu_regs->refcyc_per_req_delivery_pre_cur0 = 0;
 		disp_ttu_regs->refcyc_per_req_delivery_cur0 = 0;
@@ -1901,10 +1901,10 @@ void dml1_rq_dlg_get_dlg_params(
 
 	/* TTU - Misc */
 	disp_ttu_regs->qos_level_low_wm = 0;
-	ASSERT(disp_ttu_regs->qos_level_low_wm < dml_pow(2, 14));
+	ASSERT_WARN(disp_ttu_regs->qos_level_low_wm < dml_pow(2, 14));
 	disp_ttu_regs->qos_level_high_wm = (unsigned int) (4.0 * (double) htotal
 			* ref_freq_to_pix_freq);
-	ASSERT(disp_ttu_regs->qos_level_high_wm < dml_pow(2, 14));
+	ASSERT_WARN(disp_ttu_regs->qos_level_high_wm < dml_pow(2, 14));
 
 	disp_ttu_regs->qos_level_flip = 14;
 	disp_ttu_regs->qos_level_fixed_l = 8;
@@ -1915,7 +1915,7 @@ void dml1_rq_dlg_get_dlg_params(
 	disp_ttu_regs->qos_ramp_disable_cur0 = 0;
 
 	disp_ttu_regs->min_ttu_vblank = min_ttu_vblank * refclk_freq_in_mhz;
-	ASSERT(disp_ttu_regs->min_ttu_vblank < dml_pow(2, 24));
+	ASSERT_WARN(disp_ttu_regs->min_ttu_vblank < dml_pow(2, 24));
 
 	print__ttu_regs_st(mode_lib, disp_ttu_regs);
 	print__dlg_regs_st(mode_lib, disp_dlg_regs);
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c b/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c
index 8dabb1ac0b68..4b0f5f626d0f 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c
@@ -1792,7 +1792,7 @@ static void CalculatePrefetchMode(
 			*MinPrefetchMode = 0;
 		} else {
 			dml_print("ERROR: Invalid AllowForPStateChangeOrStutterInVBlank setting! val=%u\n", AllowForPStateChangeOrStutterInVBlank);
-			ASSERT(0);
+			ASSERT_WARN(0);
 		}
 		*MaxPrefetchMode = *MinPrefetchMode;
 	}
@@ -2647,7 +2647,7 @@ static dml_uint_t CalculateVMAndRowBytes(
 		dml_print("DML::%s: dpte_row_width_ub = %u (tiled horz)\n", __func__, *dpte_row_width_ub);
 #endif
 
-		ASSERT(*PixelPTEReqWidth);
+		ASSERT_WARN(*PixelPTEReqWidth);
 		if (*PixelPTEReqWidth != 0)
 			*PixelPTEBytesPerRow = *dpte_row_width_ub / *PixelPTEReqWidth * *PTERequestSize;
 	} else {
@@ -9381,7 +9381,7 @@ void dml_core_mode_programming(struct display_mode_lib_st *mode_lib, const struc
 		s->iteration++;
 		if (s->iteration > 2500) {
 			dml_print("ERROR: DML::%s: Too many errors, exit now\n", __func__);
-			ASSERT(0);
+			ASSERT_WARN(0);
 		}
 	} while (!(locals->PrefetchAndImmediateFlipSupported || s->AllPrefetchModeTested));
 
@@ -9692,7 +9692,7 @@ void dml_core_mode_programming(struct display_mode_lib_st *mode_lib, const struc
 		if (s->blank_lines_remaining < 0) {
 			dml_print("ERROR: Vstartup is larger than vblank!?\n");
 			s->blank_lines_remaining = 0;
-			ASSERT(0);
+			ASSERT_WARN(0);
 		}
 		locals->MIN_DST_Y_NEXT_START[k] = s->dlg_vblank_start + s->blank_lines_remaining + s->LSetup;
 
@@ -10036,7 +10036,7 @@ static struct soc_state_bounding_box_st dml_get_soc_state_bounding_box(
 
 	if (state_idx >= (dml_uint_t)states->num_states) {
 		dml_print("DML::%s: ERROR: Invalid state_idx=%u! num_states=%u\n", __func__, state_idx, states->num_states);
-		ASSERT(0);
+		ASSERT_WARN(0);
 	}
 	return (states->state_array[state_idx]);
 }
@@ -10160,10 +10160,10 @@ static dml_uint_t mode_support_pwr_states(
 	*lowest_state_idx = end_state_idx;
 
 	if (end_state_idx < start_state_idx)
-		ASSERT(0);
+		ASSERT_WARN(0);
 
 	if (end_state_idx >= mode_lib->states.num_states) // idx is 0-based
-		ASSERT(0);
+		ASSERT_WARN(0);
 
 	for (state_idx = start_state_idx; state_idx <= end_state_idx; state_idx++) {
 		if (dml_mode_support(mode_lib, state_idx, display_cfg)) {
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c b/drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c
index c247aee89caf..d58c357cbf61 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c
@@ -68,7 +68,7 @@ dml_bool_t dml_util_is_420(enum dml_source_format_class source_format)
 		val = 0;
 		break;
 	default:
-		ASSERT(0);
+		ASSERT_WARN(0);
 		break;
 	}
 	return val;
@@ -77,7 +77,7 @@ dml_bool_t dml_util_is_420(enum dml_source_format_class source_format)
 static inline float dcn_bw_pow(float a, float exp)
 {
 	float temp;
-	/*ASSERT(exp == (int)exp);*/
+	/*ASSERT_WARN(exp == (int)exp);*/
 	if ((int)exp == 0)
 		return 1;
 	temp = dcn_bw_pow(a, (int)(exp / 2));
@@ -93,14 +93,14 @@ static inline float dcn_bw_pow(float a, float exp)
 
 static inline float dcn_bw_ceil2(const float arg, const float significance)
 {
-	ASSERT(significance != 0);
+	ASSERT_WARN(significance != 0);
 
 	return ((int)(arg / significance + 0.99999)) * significance;
 }
 
 static inline float dcn_bw_floor2(const float arg, const float significance)
 {
-	ASSERT(significance != 0);
+	ASSERT_WARN(significance != 0);
 
 	return ((int)(arg / significance)) * significance;
 }
@@ -765,7 +765,7 @@ dml_uint_t dml_get_pipe_idx(const struct display_mode_lib_st *mode_lib, dml_uint
 	dml_uint_t     pipe_idx = 0;
 	dml_bool_t     pipe_found = 0;
 
-	ASSERT(plane_idx < __DML_NUM_PLANES__);
+	ASSERT_WARN(plane_idx < __DML_NUM_PLANES__);
 
 	for (dml_uint_t i = 0; i < __DML_NUM_PLANES__; i++) {
 		if (plane_idx == mode_lib->mp.pipe_plane[i]) {
@@ -774,7 +774,7 @@ dml_uint_t dml_get_pipe_idx(const struct display_mode_lib_st *mode_lib, dml_uint
 			break;
 		}
 	}
-	ASSERT(pipe_found != 0);
+	ASSERT_WARN(pipe_found != 0);
 
 	return pipe_idx;
 }
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c
index c6a5a8614679..96989f7acaf2 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c
@@ -579,7 +579,7 @@ static enum dml2_swizzle_mode gfx_addr3_to_dml2_swizzle_mode(enum swizzle_mode_a
 		break;
 	default:
 		/* invalid swizzle mode for DML2.1 */
-		ASSERT(false);
+		ASSERT_WARN(false);
 		dml2_mode = dml2_sw_linear;
 	}
 
@@ -753,7 +753,7 @@ static const struct scaler_data *get_scaler_data_for_plane(
 		}
 	}
 
-	ASSERT(i < MAX_PIPES);
+	ASSERT_WARN(i < MAX_PIPES);
 	return &temp_pipe->plane_res.scl_data;
 }
 
@@ -945,7 +945,7 @@ static unsigned int map_plane_to_dml21_display_cfg(const struct dml2_context *dm
 	int location = -1;
 
 	if (!dml21_wrapper_get_plane_id(context, plane, &plane_id)) {
-		ASSERT(false);
+		ASSERT_WARN(false);
 		return -1;
 	}
 
@@ -1010,7 +1010,7 @@ bool dml21_map_dc_state_into_dml_display_cfg(const struct dc *in_dc, struct dc_s
 		if (disp_cfg_stream_location < 0)
 			disp_cfg_stream_location = dml_dispcfg->num_streams++;
 
-		ASSERT(disp_cfg_stream_location >= 0 && disp_cfg_stream_location <= __DML2_WRAPPER_MAX_STREAMS_PLANES__);
+		ASSERT_WARN(disp_cfg_stream_location >= 0 && disp_cfg_stream_location <= __DML2_WRAPPER_MAX_STREAMS_PLANES__);
 		populate_dml21_timing_config_from_stream_state(&dml_dispcfg->stream_descriptors[disp_cfg_stream_location].timing, context->streams[stream_index], dml_ctx);
 		adjust_dml21_hblank_timing_config_from_pipe_ctx(&dml_dispcfg->stream_descriptors[disp_cfg_stream_location].timing, &context->res_ctx.pipe_ctx[stream_index]);
 		populate_dml21_output_config_from_stream_state(&dml_dispcfg->stream_descriptors[disp_cfg_stream_location].output, context->streams[stream_index], &context->res_ctx.pipe_ctx[stream_index]);
@@ -1035,7 +1035,7 @@ bool dml21_map_dc_state_into_dml_display_cfg(const struct dc *in_dc, struct dc_s
 				if (disp_cfg_plane_location < 0)
 					disp_cfg_plane_location = dml_dispcfg->num_planes++;
 
-				ASSERT(disp_cfg_plane_location >= 0 && disp_cfg_plane_location <= __DML2_WRAPPER_MAX_STREAMS_PLANES__);
+				ASSERT_WARN(disp_cfg_plane_location >= 0 && disp_cfg_plane_location <= __DML2_WRAPPER_MAX_STREAMS_PLANES__);
 
 				populate_dml21_surface_config_from_plane_state(in_dc, &dml_dispcfg->plane_descriptors[disp_cfg_plane_location].surface, context->stream_status[stream_index].plane_states[plane_index]);
 				populate_dml21_plane_config_from_plane_state(dml_ctx, &dml_dispcfg->plane_descriptors[disp_cfg_plane_location], context->stream_status[stream_index].plane_states[plane_index], context, stream_index);
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_utils.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_utils.c
index 51d491bffa32..8ca3c1879dcc 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_utils.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_utils.c
@@ -273,7 +273,7 @@ void dml21_populate_mall_allocation_size(struct dc_state *context,
 bool check_dp2p0_output_encoder(const struct pipe_ctx *pipe_ctx)
 {
 	/* If this assert is hit then we have a link encoder dynamic management issue */
-	ASSERT(pipe_ctx->stream_res.hpo_dp_stream_enc ? pipe_ctx->link_res.hpo_dp_link_enc != NULL : true);
+	ASSERT_WARN(pipe_ctx->stream_res.hpo_dp_stream_enc ? pipe_ctx->link_res.hpo_dp_link_enc != NULL : true);
 	return (pipe_ctx->stream_res.hpo_dp_stream_enc &&
 		pipe_ctx->link_res.hpo_dp_link_enc &&
 		dc_is_dp_signal(pipe_ctx->stream->signal));
@@ -503,7 +503,7 @@ void dml21_build_fams2_programming(const struct dc *dc,
 
 			dml_stream_idx = dml21_helper_find_dml_pipe_idx_by_stream_id(dml_ctx, stream->stream_id);
 			if (dml_stream_idx < 0) {
-				ASSERT(dml_stream_idx >= 0);
+				ASSERT_WARN(dml_stream_idx >= 0);
 				continue;
 			}
 
@@ -542,7 +542,7 @@ void dml21_build_fams2_programming(const struct dc *dc,
 				phantom_status = dml_ctx->config.callbacks.get_stream_status(context, phantom_stream);
 
 				/* phantom status should always be present */
-				ASSERT(phantom_status);
+				ASSERT_WARN(phantom_status);
 				static_state->sub_state.subvp.phantom_otg_inst = phantom_status->primary_otg_inst;
 
 				/* populate pipe masks for phantom planes */
@@ -558,7 +558,7 @@ void dml21_build_fams2_programming(const struct dc *dc,
 				}
 				break;
 			default:
-				ASSERT(false);
+				ASSERT_WARN(false);
 				break;
 			}
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c
index bbc28b9a15a3..d7f95fb4bce4 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c
@@ -328,7 +328,7 @@ void dml21_prepare_mcache_programming(struct dc *in_dc, struct dc_state *context
 
 		/* get config for each pipe */
 		for (dc_pipe_index = 0; dc_pipe_index < num_pipes; dc_pipe_index++) {
-			ASSERT(dc_main_pipes[dc_pipe_index]);
+			ASSERT_WARN(dc_main_pipes[dc_pipe_index]);
 			dml21_get_pipe_mcache_config(context, dc_main_pipes[dc_pipe_index], pln_prog, &mcache_config->pipe_configurations[dc_pipe_index]);
 		}
 
@@ -345,7 +345,7 @@ void dml21_prepare_mcache_programming(struct dc *in_dc, struct dc_state *context
 			l->build_mcache_programming_params.num_configurations++;
 
 			for (dc_pipe_index = 0; dc_pipe_index < num_pipes; dc_pipe_index++) {
-				ASSERT(dc_phantom_pipes[dc_pipe_index]);
+				ASSERT_WARN(dc_phantom_pipes[dc_pipe_index]);
 				dml21_get_pipe_mcache_config(context, dc_phantom_pipes[dc_pipe_index], pln_prog, &mcache_config->pipe_configurations[dc_pipe_index]);
 			}
 
@@ -368,7 +368,7 @@ void dml21_prepare_mcache_programming(struct dc *in_dc, struct dc_state *context
 
 		/* get config for each pipe */
 		for (dc_pipe_index = 0; dc_pipe_index < num_pipes; dc_pipe_index++) {
-			ASSERT(dc_main_pipes[dc_pipe_index]);
+			ASSERT_WARN(dc_main_pipes[dc_pipe_index]);
 			if (l->build_mcache_programming_params.per_plane_pipe_mcache_regs[dml_prog_idx][dc_pipe_index]) {
 				memcpy(&dc_main_pipes[dc_pipe_index]->mcache_regs,
 						l->build_mcache_programming_params.per_plane_pipe_mcache_regs[dml_prog_idx][dc_pipe_index],
@@ -382,7 +382,7 @@ void dml21_prepare_mcache_programming(struct dc *in_dc, struct dc_state *context
 				dc_main_pipes[0]->stream &&
 				dc_phantom_pipes[0]->plane_state) {
 			for (dc_pipe_index = 0; dc_pipe_index < num_pipes; dc_pipe_index++) {
-				ASSERT(dc_phantom_pipes[dc_pipe_index]);
+				ASSERT_WARN(dc_phantom_pipes[dc_pipe_index]);
 				if (l->build_mcache_programming_params.per_plane_pipe_mcache_regs[dml_phantom_prog_idx][dc_pipe_index]) {
 					memcpy(&dc_phantom_pipes[dc_pipe_index]->mcache_regs,
 							l->build_mcache_programming_params.per_plane_pipe_mcache_regs[dml_phantom_prog_idx][dc_pipe_index],
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_standalone_libraries/lib_float_math.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_standalone_libraries/lib_float_math.c
index e17b5ceba447..d0607b369afd 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_standalone_libraries/lib_float_math.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_standalone_libraries/lib_float_math.c
@@ -4,7 +4,7 @@
 
 #include "lib_float_math.h"
 
-#define ASSERT(condition)
+#define ASSERT_WARN(condition)
 
 #define isNaN(number) ((number) != (number))
 
@@ -46,7 +46,7 @@ double math_max2(const double arg1, const double arg2)
 
 double math_floor2(const double arg, const double significance)
 {
-	ASSERT(significance != 0);
+	ASSERT_WARN(significance != 0);
 
 	return ((int)(arg / significance)) * significance;
 }
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/inc/dml2_debug.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/inc/dml2_debug.c
index e9b8e10695ae..863f1ab287c4 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/inc/dml2_debug.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/inc/dml2_debug.c
@@ -27,5 +27,5 @@ int dml2_printf(const char *format, ...)
 
 void dml2_assert(int condition)
 {
-	//ASSERT(condition);
+	//ASSERT_WARN(condition);
 }
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml2_dc_resource_mgmt.c b/drivers/gpu/drm/amd/display/dc/dml2/dml2_dc_resource_mgmt.c
index 1ed21c1b86a5..11dceb51115f 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml2_dc_resource_mgmt.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml2_dc_resource_mgmt.c
@@ -88,7 +88,7 @@ static int find_disp_cfg_idx_by_plane_id(struct dml2_dml_to_dc_pipe_mapping *map
 			return  i;
 	}
 
-	ASSERT(false);
+	ASSERT_WARN(false);
 	return __DML2_WRAPPER_MAX_STREAMS_PLANES__;
 }
 
@@ -101,7 +101,7 @@ static int find_disp_cfg_idx_by_stream_id(struct dml2_dml_to_dc_pipe_mapping *ma
 			return  i;
 	}
 
-	ASSERT(false);
+	ASSERT_WARN(false);
 	return __DML2_WRAPPER_MAX_STREAMS_PLANES__;
 }
 
@@ -212,11 +212,11 @@ static bool validate_pipe_assignment(const struct dml2_context *ctx, const struc
 //					// TODO: could also do additional verification that the pipes in tree are the same as
 //					// pipes_assigned_to_plane
 //				} else {
-//					ASSERT(false);
+//					ASSERT_WARN(false);
 //					return false;
 //				}
 //			} else {
-//				ASSERT(false);
+//				ASSERT_WARN(false);
 //				return false;
 //			}
 //		}
@@ -398,7 +398,7 @@ static bool find_more_pipes_for_stream(struct dml2_context *ctx,
 		}
 	}
 
-	ASSERT(pipes_needed <= 0); // Validation should prevent us from building a pipe context that exceeds the number of HW resoruces available
+	ASSERT_WARN(pipes_needed <= 0); // Validation should prevent us from building a pipe context that exceeds the number of HW resoruces available
 
 	return pipes_needed <= 0;
 }
@@ -464,7 +464,7 @@ static bool find_more_free_pipes(struct dml2_context *ctx,
 		}
 	}
 
-	ASSERT(pipes_needed == 0); // Validation should prevent us from building a pipe context that exceeds the number of HW resoruces available
+	ASSERT_WARN(pipes_needed == 0); // Validation should prevent us from building a pipe context that exceeds the number of HW resoruces available
 
 	return pipes_needed == 0;
 }
@@ -520,7 +520,7 @@ static void calculate_odm_slices(const struct dc_stream_state *stream, unsigned
 	int i;
 
 	if (odm_factor < 1 || odm_factor > 4) {
-		ASSERT(false);
+		ASSERT_WARN(false);
 		return;
 	}
 
@@ -562,7 +562,7 @@ static void add_odm_slice_to_odm_tree(struct dml2_context *ctx,
 
 	// MPCC Combine + ODM Combine is not supported, so there should never be a case where the current plane
 	// has more than 1 pipe mapped to it for a given slice.
-	ASSERT(scratch->pipe_pool.num_pipes_assigned_to_plane_for_mpcc_combine == 1 || scratch->pipe_pool.num_pipes_assigned_to_plane_for_odm_combine == 1);
+	ASSERT_WARN(scratch->pipe_pool.num_pipes_assigned_to_plane_for_mpcc_combine == 1 || scratch->pipe_pool.num_pipes_assigned_to_plane_for_odm_combine == 1);
 
 	for (i = 0; i < scratch->pipe_pool.num_pipes_assigned_to_plane_for_mpcc_combine; i++) {
 		pipe = &state->res_ctx.pipe_ctx[scratch->pipe_pool.pipes_assigned_to_plane[odm_slice_index][i]];
@@ -638,13 +638,13 @@ static struct pipe_ctx *assign_pipes_to_stream(struct dml2_context *ctx, struct
 	pipes_needed = odm_factor;
 
 	master_pipe = find_master_pipe_of_stream(ctx, state, stream->stream_id);
-	ASSERT(master_pipe);
+	ASSERT_WARN(master_pipe);
 
 	pipes_assigned = find_pipes_assigned_to_stream(ctx, state, stream->stream_id, pipes);
 
 	find_more_free_pipes(ctx, state, stream->stream_id, pipes, &pipes_assigned, pipes_needed - pipes_assigned, existing_state);
 
-	ASSERT(pipes_assigned == pipes_needed);
+	ASSERT_WARN(pipes_assigned == pipes_needed);
 
 	next_pipe_to_assign = 0;
 	for (odm_slice = 0; odm_slice < odm_factor; odm_slice++)
@@ -674,20 +674,20 @@ static struct pipe_ctx *assign_pipes_to_plane(struct dml2_context *ctx, struct d
 	int odm_slice, mpc_slice;
 
 	if (!get_plane_id(ctx, state, plane, stream->stream_id, plane_index, &plane_id)) {
-		ASSERT(false);
+		ASSERT_WARN(false);
 		return master_pipe;
 	}
 
 	pipes_needed = mpc_factor * odm_factor;
 
 	master_pipe = find_master_pipe_of_plane(ctx, state, plane_id);
-	ASSERT(master_pipe);
+	ASSERT_WARN(master_pipe);
 
 	pipes_assigned = find_pipes_assigned_to_plane(ctx, state, plane_id, pipes);
 
 	find_more_pipes_for_stream(ctx, state, stream->stream_id, pipes, &pipes_assigned, pipes_needed - pipes_assigned, existing_state);
 
-	ASSERT(pipes_assigned >= pipes_needed);
+	ASSERT_WARN(pipes_assigned >= pipes_needed);
 
 	next_pipe_to_assign = 0;
 	for (odm_slice = 0; odm_slice < odm_factor; odm_slice++)
@@ -782,7 +782,7 @@ static void map_pipes_for_plane(struct dml2_context *ctx, struct dc_state *state
 	int i;
 
 	if (!get_plane_id(ctx, state, plane, stream->stream_id, plane_index, &plane_id)) {
-		ASSERT(false);
+		ASSERT_WARN(false);
 		return;
 	}
 
@@ -841,13 +841,13 @@ static unsigned int get_target_mpc_factor(struct dml2_context *ctx,
 			/* get stream id of main stream */
 			main_stream = ctx->config.svp_pstate.callbacks.get_paired_subvp_stream(state, stream);
 			if (!main_stream) {
-				ASSERT(false);
+				ASSERT_WARN(false);
 				return 1;
 			}
 
 			main_stream_status = ctx->config.callbacks.get_stream_status(state, main_stream);
 			if (!main_stream_status) {
-				ASSERT(false);
+				ASSERT_WARN(false);
 				return 1;
 			}
 
@@ -863,7 +863,7 @@ static unsigned int get_target_mpc_factor(struct dml2_context *ctx,
 		mpc_factor = ctx->v21.mode_programming.programming->plane_programming[cfg_idx].num_dpps_required;
 	} else {
 		mpc_factor = 1;
-		ASSERT(false);
+		ASSERT_WARN(false);
 	}
 
 	/* For stereo timings, we need to pipe split */
@@ -916,7 +916,7 @@ static unsigned int get_target_odm_factor(
 	}
 
 failed:
-	ASSERT(false);
+	ASSERT_WARN(false);
 	return 1;
 }
 
@@ -940,7 +940,7 @@ static unsigned int get_source_mpc_factor(const struct dml2_context *ctx,
 	int dpp_pipe_count = ctx->config.callbacks.get_dpp_pipes_for_plane(plane,
 			&state->res_ctx, dpp_pipes);
 
-	ASSERT(dpp_pipe_count > 0);
+	ASSERT_WARN(dpp_pipe_count > 0);
 	return ctx->config.callbacks.get_mpc_slice_count(dpp_pipes[0]);
 }
 
@@ -1115,7 +1115,7 @@ bool dml2_map_dc_pipes(struct dml2_context *ctx, struct dc_state *state, const s
 		} else if (ODMMode[stream_disp_cfg_index] == dml_odm_mode_combine_4to1) {
 			scratch.odm_info.odm_factor = 4;
 		} else {
-			ASSERT(false);
+			ASSERT_WARN(false);
 			scratch.odm_info.odm_factor = 1;
 		}
 
@@ -1131,7 +1131,7 @@ bool dml2_map_dc_pipes(struct dml2_context *ctx, struct dc_state *state, const s
 			} else if (ODMMode[stream_disp_cfg_index] == 4) {
 				scratch.odm_info.odm_factor = 4;
 			} else {
-				ASSERT(false);
+				ASSERT_WARN(false);
 				scratch.odm_info.odm_factor = 1;
 			}
 		}
@@ -1164,7 +1164,7 @@ bool dml2_map_dc_pipes(struct dml2_context *ctx, struct dc_state *state, const s
 					scratch.mpc_info.mpc_factor = 1;
 				}
 
-				ASSERT(scratch.odm_info.odm_factor * scratch.mpc_info.mpc_factor > 0);
+				ASSERT_WARN(scratch.odm_info.odm_factor * scratch.mpc_info.mpc_factor > 0);
 
 				// Clear the pool assignment scratch (which is per plane)
 				memset(&scratch.pipe_pool, 0, sizeof(struct dc_plane_pipe_pool));
@@ -1173,21 +1173,21 @@ bool dml2_map_dc_pipes(struct dml2_context *ctx, struct dc_state *state, const s
 					state->stream_status[stream_index].plane_states[plane_index], plane_index, &scratch, existing_state);
 			} else {
 				// Plane ID cannot be generated, therefore no DML mapping can be performed.
-				ASSERT(false);
+				ASSERT_WARN(false);
 			}
 		}
 
 	}
 
 	if (!validate_pipe_assignment(ctx, state, disp_cfg, mapping))
-		ASSERT(false);
+		ASSERT_WARN(false);
 
 	for (i = 0; i < ctx->config.dcn_pipe_count; i++) {
 		struct pipe_ctx *pipe = &state->res_ctx.pipe_ctx[i];
 
 		if (pipe->plane_state) {
 			if (!ctx->config.callbacks.build_scaling_params(pipe)) {
-				ASSERT(false);
+				ASSERT_WARN(false);
 			}
 		}
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c b/drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c
index c4c52173ef22..f22287727fde 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml2_policy.c
@@ -95,7 +95,7 @@ static void insert_entry_into_table_sorted(const struct soc_bounding_box_st *soc
 		for (i = table->num_states; i > index; i--) {
 			table->state_array[i] = table->state_array[i - 1];
 		}
-		//ASSERT(index < MAX_CLK_TABLE_SIZE);
+		//ASSERT_WARN(index < MAX_CLK_TABLE_SIZE);
 	}
 
 	table->state_array[index] = *entry;
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c b/drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c
index bde4250853b1..1bf42f3b2072 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c
@@ -949,7 +949,7 @@ static void get_scaler_data_for_plane(const struct dc_plane_state *in, struct dc
 		}
 	}
 
-	ASSERT(i < MAX_PIPES);
+	ASSERT_WARN(i < MAX_PIPES);
 	memcpy(out, &temp_pipe->plane_res.scl_data, sizeof(*out));
 }
 
@@ -1134,7 +1134,7 @@ static unsigned int map_plane_to_dml_display_cfg(const struct dml2_context *dml2
 	int location = -1;
 
 	if (!get_plane_id(context->bw_ctx.dml2, context, plane, stream_id, plane_index, &plane_id)) {
-		ASSERT(false);
+		ASSERT_WARN(false);
 		return -1;
 	}
 
@@ -1153,7 +1153,7 @@ static void apply_legacy_svp_drr_settings(struct dml2_context *dml2, const struc
 	int i;
 
 	if (state->bw_ctx.bw.dcn.clk.fw_based_mclk_switching) {
-		ASSERT(state->stream_count == 1);
+		ASSERT_WARN(state->stream_count == 1);
 		dml_dispcfg->timing.DRRDisplay[0] = true;
 	} else if (state->bw_ctx.bw.dcn.legacy_svp_drr_stream_index_valid) {
 
@@ -1303,7 +1303,7 @@ void map_dc_state_into_dml_display_cfg(struct dml2_context *dml2, struct dc_stat
 		if (disp_cfg_stream_location < 0)
 			disp_cfg_stream_location = dml_dispcfg->num_timings++;
 
-		ASSERT(disp_cfg_stream_location >= 0 && disp_cfg_stream_location <= __DML2_WRAPPER_MAX_STREAMS_PLANES__);
+		ASSERT_WARN(disp_cfg_stream_location >= 0 && disp_cfg_stream_location <= __DML2_WRAPPER_MAX_STREAMS_PLANES__);
 
 		populate_dml_timing_cfg_from_stream_state(&dml_dispcfg->timing, disp_cfg_stream_location, context->streams[i]);
 		populate_dml_output_cfg_from_stream_state(&dml_dispcfg->output, disp_cfg_stream_location, context->streams[i], current_pipe_context, dml2);
@@ -1343,7 +1343,7 @@ void map_dc_state_into_dml_display_cfg(struct dml2_context *dml2, struct dc_stat
 				if (disp_cfg_plane_location < 0)
 					disp_cfg_plane_location = dml_dispcfg->num_surfaces++;
 
-				ASSERT(disp_cfg_plane_location >= 0 && disp_cfg_plane_location <= __DML2_WRAPPER_MAX_STREAMS_PLANES__);
+				ASSERT_WARN(disp_cfg_plane_location >= 0 && disp_cfg_plane_location <= __DML2_WRAPPER_MAX_STREAMS_PLANES__);
 
 				populate_dml_surface_cfg_from_plane_state(dml2->v20.dml_core_ctx.project, &dml_dispcfg->surface, disp_cfg_plane_location, context->stream_status[i].plane_states[j]);
 				populate_dml_plane_cfg_from_plane_state(
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c b/drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c
index 9a33158b63bf..98c62eea0b90 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c
@@ -159,7 +159,7 @@ bool is_dp2p0_output_encoder(const struct pipe_ctx *pipe_ctx)
 		return false;
 
 	/* If this assert is hit then we have a link encoder dynamic management issue */
-	ASSERT(pipe_ctx->stream_res.hpo_dp_stream_enc ? pipe_ctx->link_res.hpo_dp_link_enc != NULL : true);
+	ASSERT_WARN(pipe_ctx->stream_res.hpo_dp_stream_enc ? pipe_ctx->link_res.hpo_dp_link_enc != NULL : true);
 
 	return (pipe_ctx->stream_res.hpo_dp_stream_enc &&
 		pipe_ctx->link_res.hpo_dp_link_enc &&
@@ -312,8 +312,8 @@ void dml2_calculate_rq_and_dlg_params(const struct dc *dc, struct dc_state *cont
 
 		if (dml_pipe_idx == 0xFFFFFFFF)
 			continue;
-		ASSERT(in_ctx->v20.scratch.dml_to_dc_pipe_mapping.dml_pipe_idx_to_stream_id_valid[dml_pipe_idx]);
-		ASSERT(in_ctx->v20.scratch.dml_to_dc_pipe_mapping.dml_pipe_idx_to_stream_id[dml_pipe_idx] == context->res_ctx.pipe_ctx[dc_pipe_ctx_index].stream->stream_id);
+		ASSERT_WARN(in_ctx->v20.scratch.dml_to_dc_pipe_mapping.dml_pipe_idx_to_stream_id_valid[dml_pipe_idx]);
+		ASSERT_WARN(in_ctx->v20.scratch.dml_to_dc_pipe_mapping.dml_pipe_idx_to_stream_id[dml_pipe_idx] == context->res_ctx.pipe_ctx[dc_pipe_ctx_index].stream->stream_id);
 
 		/* Use the dml_pipe_index here for the getters to fetch the correct values and dc_pipe_index in the pipe_ctx to populate them
 		 * at the right locations.
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c b/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c
index 9190c1328d5b..ffa22675cd42 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c
@@ -249,7 +249,7 @@ static int calculate_lowest_supported_state_for_temp_read(struct dml2_context *d
 
 		if (pipe->plane_state) {
 			if (!dml2->config.callbacks.build_scaling_params(pipe)) {
-				ASSERT(false);
+				ASSERT_WARN(false);
 				return false;
 			}
 		}
@@ -272,7 +272,7 @@ static int calculate_lowest_supported_state_for_temp_read(struct dml2_context *d
 			map_hw_resources(dml2, &s->cur_display_config, &s->evaluation_info);
 			dml_result = dml_mode_programming(&dml2->v20.dml_core_ctx, s_global->mode_support_params.out_lowest_state_idx, &s->cur_display_config, true);
 
-			ASSERT(dml_result);
+			ASSERT_WARN(dml_result);
 
 			dml2_extract_watermark_set(&dml2->v20.g6_temp_read_watermark_set, &dml2->v20.dml_core_ctx);
 			dml2->v20.g6_temp_read_watermark_set.cstate_pstate.fclk_pstate_change_ns = dml2->v20.g6_temp_read_watermark_set.cstate_pstate.pstate_change_ns;
@@ -355,7 +355,7 @@ static bool dml_mode_support_wrapper(struct dml2_context *dml2,
 
 		if (pipe->plane_state) {
 			if (!dml2->config.callbacks.build_scaling_params(pipe)) {
-				ASSERT(false);
+				ASSERT_WARN(false);
 				return false;
 			}
 		}
@@ -538,7 +538,7 @@ static bool call_dml_mode_support_and_programming(struct dc_state *context)
 
 	min_state_for_g6_temp_read = calculate_lowest_supported_state_for_temp_read(dml2, context);
 
-	ASSERT(min_state_for_g6_temp_read >= 0);
+	ASSERT_WARN(min_state_for_g6_temp_read >= 0);
 
 	if (!dml2->config.use_native_pstate_optimization) {
 		result = optimize_pstate_with_svp_and_drr(dml2, context);
@@ -618,7 +618,7 @@ static bool dml2_validate_and_build_resource(const struct dc *in_dc, struct dc_s
 				dml2_map_dc_pipes(dml2, context, &s->cur_display_config, &s->dml_to_dc_pipe_mapping, in_dc->current_state);
 			}
 			need_recalculation = dml2_verify_det_buffer_configuration(dml2, context, &dml2->det_helper_scratch);
-			ASSERT(need_recalculation == false);
+			ASSERT_WARN(need_recalculation == false);
 		}
 	}
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml_display_rq_dlg_calc.c b/drivers/gpu/drm/amd/display/dc/dml2/dml_display_rq_dlg_calc.c
index 377ef6d01ae5..852c09b3e3d1 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml_display_rq_dlg_calc.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml_display_rq_dlg_calc.c
@@ -130,14 +130,14 @@ void dml_rq_dlg_get_rq_reg(dml_display_rq_regs_st			*rq_regs,
 	pte_row_height_linear = (dml_uint_t)(dml_get_dpte_row_height_linear_l(mode_lib, pipe_idx));
 
 	if (sw_mode == dml_sw_linear)
-		ASSERT(pte_row_height_linear >= 8);
+		ASSERT_WARN(pte_row_height_linear >= 8);
 
 	rq_regs->rq_regs_l.pte_row_height_linear = (dml_uint_t)(dml_floor(dml_log2((dml_float_t) pte_row_height_linear), 1) - 3);
 
 	if (dual_plane) {
 		dml_uint_t p1_pte_row_height_linear = (dml_uint_t)(dml_get_dpte_row_height_linear_c(mode_lib, pipe_idx));
 		if (sw_mode == dml_sw_linear)
-			ASSERT(p1_pte_row_height_linear >= 8);
+			ASSERT_WARN(p1_pte_row_height_linear >= 8);
 
 		rq_regs->rq_regs_c.pte_row_height_linear = (dml_uint_t)(dml_floor(dml_log2((dml_float_t) p1_pte_row_height_linear), 1) - 3);
 	}
@@ -279,9 +279,9 @@ void dml_rq_dlg_get_dlg_reg(dml_display_dlg_regs_st		   *disp_dlg_regs,
 	memset(disp_dlg_regs, 0, sizeof(*disp_dlg_regs));
 	memset(disp_ttu_regs, 0, sizeof(*disp_ttu_regs));
 
-	ASSERT(refclk_freq_in_mhz != 0);
-	ASSERT(pclk_freq_in_mhz != 0);
-	ASSERT(ref_freq_to_pix_freq < 4.0);
+	ASSERT_WARN(refclk_freq_in_mhz != 0);
+	ASSERT_WARN(pclk_freq_in_mhz != 0);
+	ASSERT_WARN(ref_freq_to_pix_freq < 4.0);
 
 	// Need to figure out which side of odm combine we're in
 	// Assume the pipe instance under the same plane is in order
@@ -312,7 +312,7 @@ void dml_rq_dlg_get_dlg_reg(dml_display_dlg_regs_st		   *disp_dlg_regs,
 	}
 	dml_print("DML_DLG: %s: refcyc_h_blank_end = %d\n", __func__, disp_dlg_regs->refcyc_h_blank_end);
 
-	ASSERT(disp_dlg_regs->refcyc_h_blank_end < (dml_uint_t)dml_pow(2, 13));
+	ASSERT_WARN(disp_dlg_regs->refcyc_h_blank_end < (dml_uint_t)dml_pow(2, 13));
 
 	disp_dlg_regs->ref_freq_to_pix_freq = (dml_uint_t)(ref_freq_to_pix_freq * dml_pow(2, 19));
 	temp = dml_pow(2, 8);
@@ -355,9 +355,9 @@ void dml_rq_dlg_get_dlg_reg(dml_display_dlg_regs_st		   *disp_dlg_regs,
 	dml_print("DML_DLG: %s: dst_y_per_vm_vblank  = %3.2f\n", __func__, dst_y_per_vm_vblank);
 	dml_print("DML_DLG: %s: dst_y_per_row_vblank = %3.2f\n", __func__, dst_y_per_row_vblank);
 
-	ASSERT(dst_y_per_vm_vblank < max_dst_y_per_vm_vblank);
-	ASSERT(dst_y_per_row_vblank < max_dst_y_per_row_vblank);
-	ASSERT(dst_y_prefetch > (dst_y_per_vm_vblank + dst_y_per_row_vblank));
+	ASSERT_WARN(dst_y_per_vm_vblank < max_dst_y_per_vm_vblank);
+	ASSERT_WARN(dst_y_per_row_vblank < max_dst_y_per_row_vblank);
+	ASSERT_WARN(dst_y_prefetch > (dst_y_per_vm_vblank + dst_y_per_row_vblank));
 
 	vratio_pre_l = dml_get_vratio_prefetch_l(mode_lib, pipe_idx);
 	vratio_pre_c = dml_get_vratio_prefetch_c(mode_lib, pipe_idx);
@@ -398,7 +398,7 @@ void dml_rq_dlg_get_dlg_reg(dml_display_dlg_regs_st		   *disp_dlg_regs,
 	}
 
 	// TTU - Cursor
-	ASSERT(num_cursors <= 1);
+	ASSERT_WARN(num_cursors <= 1);
 	if (num_cursors > 0) {
 		refcyc_per_req_delivery_pre_cur0 = dml_get_refcyc_per_cursor_req_delivery_pre_in_us(mode_lib, pipe_idx) * refclk_freq_in_mhz;
 		refcyc_per_req_delivery_cur0	 = dml_get_refcyc_per_cursor_req_delivery_in_us(mode_lib, pipe_idx) * refclk_freq_in_mhz;
@@ -409,7 +409,7 @@ void dml_rq_dlg_get_dlg_reg(dml_display_dlg_regs_st		   *disp_dlg_regs,
 
 	// Assign to register structures
 	disp_dlg_regs->min_dst_y_next_start = (dml_uint_t)((dml_float_t) min_dst_y_next_start * dml_pow(2, 2));
-	ASSERT(disp_dlg_regs->min_dst_y_next_start < (dml_uint_t)dml_pow(2, 18));
+	ASSERT_WARN(disp_dlg_regs->min_dst_y_next_start < (dml_uint_t)dml_pow(2, 18));
 
 	disp_dlg_regs->dst_y_after_scaler = dst_y_after_scaler; // in terms of line
 	disp_dlg_regs->refcyc_x_after_scaler = (dml_uint_t)((dml_float_t) dst_x_after_scaler * ref_freq_to_pix_freq); // in terms of refclk
@@ -513,10 +513,10 @@ void dml_rq_dlg_get_dlg_reg(dml_display_dlg_regs_st		   *disp_dlg_regs,
 	disp_ttu_regs->min_ttu_vblank = (dml_uint_t)(min_ttu_vblank * refclk_freq_in_mhz);
 
 	// CHECK for HW registers' range, assert or clamp
-	ASSERT(refcyc_per_req_delivery_pre_l < dml_pow(2, 13));
-	ASSERT(refcyc_per_req_delivery_l < dml_pow(2, 13));
-	ASSERT(refcyc_per_req_delivery_pre_c < dml_pow(2, 13));
-	ASSERT(refcyc_per_req_delivery_c < dml_pow(2, 13));
+	ASSERT_WARN(refcyc_per_req_delivery_pre_l < dml_pow(2, 13));
+	ASSERT_WARN(refcyc_per_req_delivery_l < dml_pow(2, 13));
+	ASSERT_WARN(refcyc_per_req_delivery_pre_c < dml_pow(2, 13));
+	ASSERT_WARN(refcyc_per_req_delivery_c < dml_pow(2, 13));
 	if (disp_dlg_regs->refcyc_per_vm_group_vblank >= (dml_uint_t)dml_pow(2, 23))
 		disp_dlg_regs->refcyc_per_vm_group_vblank = (dml_uint_t)(dml_pow(2, 23) - 1);
 
@@ -530,16 +530,16 @@ void dml_rq_dlg_get_dlg_reg(dml_display_dlg_regs_st		   *disp_dlg_regs,
 		disp_dlg_regs->refcyc_per_vm_req_flip = (dml_uint_t)(dml_pow(2, 23) - 1);
 
 
-	ASSERT(disp_dlg_regs->dst_y_after_scaler < (dml_uint_t)8);
-	ASSERT(disp_dlg_regs->refcyc_x_after_scaler < (dml_uint_t)dml_pow(2, 13));
-	ASSERT(disp_dlg_regs->dst_y_per_pte_row_nom_l < (dml_uint_t)dml_pow(2, 17));
+	ASSERT_WARN(disp_dlg_regs->dst_y_after_scaler < (dml_uint_t)8);
+	ASSERT_WARN(disp_dlg_regs->refcyc_x_after_scaler < (dml_uint_t)dml_pow(2, 13));
+	ASSERT_WARN(disp_dlg_regs->dst_y_per_pte_row_nom_l < (dml_uint_t)dml_pow(2, 17));
 	if (dual_plane) {
 		if (disp_dlg_regs->dst_y_per_pte_row_nom_c >= (dml_uint_t)dml_pow(2, 17)) { // FIXME what so special about chroma, can we just assert?
 			dml_print("DML_DLG: %s: Warning dst_y_per_pte_row_nom_c %u > register max U15.2 %u\n", __func__, disp_dlg_regs->dst_y_per_pte_row_nom_c, (dml_uint_t)dml_pow(2, 17) - 1);
 		}
 	}
-	ASSERT(disp_dlg_regs->dst_y_per_meta_row_nom_l < (dml_uint_t)dml_pow(2, 17));
-	ASSERT(disp_dlg_regs->dst_y_per_meta_row_nom_c < (dml_uint_t)dml_pow(2, 17));
+	ASSERT_WARN(disp_dlg_regs->dst_y_per_meta_row_nom_l < (dml_uint_t)dml_pow(2, 17));
+	ASSERT_WARN(disp_dlg_regs->dst_y_per_meta_row_nom_c < (dml_uint_t)dml_pow(2, 17));
 
 	if (disp_dlg_regs->refcyc_per_pte_group_nom_l >= (dml_uint_t)dml_pow(2, 23))
 		disp_dlg_regs->refcyc_per_pte_group_nom_l = (dml_uint_t)(dml_pow(2, 23) - 1);
@@ -547,9 +547,9 @@ void dml_rq_dlg_get_dlg_reg(dml_display_dlg_regs_st		   *disp_dlg_regs,
 		if (disp_dlg_regs->refcyc_per_pte_group_nom_c >= (dml_uint_t)dml_pow(2, 23))
 			disp_dlg_regs->refcyc_per_pte_group_nom_c = (dml_uint_t)(dml_pow(2, 23) - 1);
 	}
-	ASSERT(disp_dlg_regs->refcyc_per_pte_group_vblank_l < (dml_uint_t)dml_pow(2, 13));
+	ASSERT_WARN(disp_dlg_regs->refcyc_per_pte_group_vblank_l < (dml_uint_t)dml_pow(2, 13));
 	if (dual_plane) {
-		ASSERT(disp_dlg_regs->refcyc_per_pte_group_vblank_c < (dml_uint_t)dml_pow(2, 13));
+		ASSERT_WARN(disp_dlg_regs->refcyc_per_pte_group_vblank_c < (dml_uint_t)dml_pow(2, 13));
 	}
 
 	if (disp_dlg_regs->refcyc_per_meta_chunk_nom_l >= (dml_uint_t)dml_pow(2, 23))
@@ -558,15 +558,15 @@ void dml_rq_dlg_get_dlg_reg(dml_display_dlg_regs_st		   *disp_dlg_regs,
 		if (disp_dlg_regs->refcyc_per_meta_chunk_nom_c >= (dml_uint_t)dml_pow(2, 23))
 			disp_dlg_regs->refcyc_per_meta_chunk_nom_c = (dml_uint_t)(dml_pow(2, 23) - 1);
 	}
-	ASSERT(disp_dlg_regs->refcyc_per_meta_chunk_vblank_l	< (dml_uint_t)dml_pow(2, 13));
-	ASSERT(disp_dlg_regs->refcyc_per_meta_chunk_vblank_c	< (dml_uint_t)dml_pow(2, 13));
-	ASSERT(disp_dlg_regs->refcyc_per_line_delivery_pre_l	< (dml_uint_t)dml_pow(2, 13));
-	ASSERT(disp_dlg_regs->refcyc_per_line_delivery_l		< (dml_uint_t)dml_pow(2, 13));
-	ASSERT(disp_dlg_regs->refcyc_per_line_delivery_pre_c	< (dml_uint_t)dml_pow(2, 13));
-	ASSERT(disp_dlg_regs->refcyc_per_line_delivery_c		< (dml_uint_t)dml_pow(2, 13));
-	ASSERT(disp_ttu_regs->qos_level_low_wm					< (dml_uint_t) dml_pow(2, 14));
-	ASSERT(disp_ttu_regs->qos_level_high_wm					< (dml_uint_t) dml_pow(2, 14));
-	ASSERT(disp_ttu_regs->min_ttu_vblank					< (dml_uint_t) dml_pow(2, 24));
+	ASSERT_WARN(disp_dlg_regs->refcyc_per_meta_chunk_vblank_l	< (dml_uint_t)dml_pow(2, 13));
+	ASSERT_WARN(disp_dlg_regs->refcyc_per_meta_chunk_vblank_c	< (dml_uint_t)dml_pow(2, 13));
+	ASSERT_WARN(disp_dlg_regs->refcyc_per_line_delivery_pre_l	< (dml_uint_t)dml_pow(2, 13));
+	ASSERT_WARN(disp_dlg_regs->refcyc_per_line_delivery_l		< (dml_uint_t)dml_pow(2, 13));
+	ASSERT_WARN(disp_dlg_regs->refcyc_per_line_delivery_pre_c	< (dml_uint_t)dml_pow(2, 13));
+	ASSERT_WARN(disp_dlg_regs->refcyc_per_line_delivery_c		< (dml_uint_t)dml_pow(2, 13));
+	ASSERT_WARN(disp_ttu_regs->qos_level_low_wm					< (dml_uint_t) dml_pow(2, 14));
+	ASSERT_WARN(disp_ttu_regs->qos_level_high_wm					< (dml_uint_t) dml_pow(2, 14));
+	ASSERT_WARN(disp_ttu_regs->min_ttu_vblank					< (dml_uint_t) dml_pow(2, 24));
 
 	dml_print_ttu_regs_st(disp_ttu_regs);
 	dml_print_dlg_regs_st(disp_dlg_regs);
diff --git a/drivers/gpu/drm/amd/display/dc/dpp/dcn10/dcn10_dpp_dscl.c b/drivers/gpu/drm/amd/display/dc/dpp/dcn10/dcn10_dpp_dscl.c
index 808bca9fb804..e51592ce41eb 100644
--- a/drivers/gpu/drm/amd/display/dc/dpp/dcn10/dcn10_dpp_dscl.c
+++ b/drivers/gpu/drm/amd/display/dc/dpp/dcn10/dcn10_dpp_dscl.c
@@ -97,7 +97,7 @@ static int dpp1_dscl_get_pixel_depth_val(enum lb_pixel_depth depth)
 	else if (depth == LB_PIXEL_DEPTH_36BPP)
 		return 3; /* 12 bpc */
 	else {
-		ASSERT(0);
+		ASSERT_WARN(0);
 		return -1; /* Unsupported */
 	}
 }
@@ -500,7 +500,7 @@ static enum lb_memory_config dpp1_dscl_find_lb_memory_config(struct dcn10_dpp *d
 			scl_data, LB_MEMORY_CONFIG_0, &num_part_y, &num_part_c);
 
 	/*Ensure we can support the requested number of vtaps*/
-	ASSERT(dpp1_dscl_is_lb_conf_valid(ceil_vratio, num_part_y, vtaps)
+	ASSERT_WARN(dpp1_dscl_is_lb_conf_valid(ceil_vratio, num_part_y, vtaps)
 			&& dpp1_dscl_is_lb_conf_valid(ceil_vratio_c, num_part_c, vtaps_c));
 
 	return LB_MEMORY_CONFIG_0;
diff --git a/drivers/gpu/drm/amd/display/dc/dpp/dcn30/dcn30_dpp.c b/drivers/gpu/drm/amd/display/dc/dpp/dcn30/dcn30_dpp.c
index 40acebd13e46..87267b808dc6 100644
--- a/drivers/gpu/drm/amd/display/dc/dpp/dcn30/dcn30_dpp.c
+++ b/drivers/gpu/drm/amd/display/dc/dpp/dcn30/dcn30_dpp.c
@@ -531,7 +531,7 @@ static void dpp3_deferred_update(struct dpp *dpp_base)
 		if (bypass_state == 0) {	// only program if bypass was latched
 			REG_UPDATE(CM_MEM_PWR_CTRL, GAMCOR_MEM_PWR_FORCE, 3);
 		} else
-			ASSERT(0); // LUT select was updated again before vupdate
+			ASSERT_WARN(0); // LUT select was updated again before vupdate
 		dpp_base->deferred_reg_writes.bits.disable_gamcor = false;
 	}
 
@@ -540,7 +540,7 @@ static void dpp3_deferred_update(struct dpp *dpp_base)
 		if (bypass_state == 0) {	// only program if bypass was latched
 			REG_UPDATE(CM_MEM_PWR_CTRL, BLNDGAM_MEM_PWR_FORCE, 3);
 		} else
-			ASSERT(0); // LUT select was updated again before vupdate
+			ASSERT_WARN(0); // LUT select was updated again before vupdate
 		dpp_base->deferred_reg_writes.bits.disable_blnd_lut = false;
 	}
 
@@ -549,7 +549,7 @@ static void dpp3_deferred_update(struct dpp *dpp_base)
 		if (bypass_state == 0) {	// only program if bypass was latched
 			REG_UPDATE(CM_MEM_PWR_CTRL2, HDR3DLUT_MEM_PWR_FORCE, 3);
 		} else
-			ASSERT(0); // LUT select was updated again before vupdate
+			ASSERT_WARN(0); // LUT select was updated again before vupdate
 		dpp_base->deferred_reg_writes.bits.disable_3dlut = false;
 	}
 
@@ -558,7 +558,7 @@ static void dpp3_deferred_update(struct dpp *dpp_base)
 		if (bypass_state == 0) {	// only program if bypass was latched
 			REG_UPDATE(CM_MEM_PWR_CTRL2, SHAPER_MEM_PWR_FORCE, 3);
 		} else
-			ASSERT(0); // LUT select was updated again before vupdate
+			ASSERT_WARN(0); // LUT select was updated again before vupdate
 		dpp_base->deferred_reg_writes.bits.disable_shaper = false;
 	}
 }
diff --git a/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_dscl.c b/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_dscl.c
index 2f92e7d4981b..7941d679a2b1 100644
--- a/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_dscl.c
+++ b/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_dscl.c
@@ -99,7 +99,7 @@ static int dpp401_dscl_get_pixel_depth_val(enum lb_pixel_depth depth)
 	else if (depth == LB_PIXEL_DEPTH_36BPP)
 		return 3; /* 12 bpc */
 	else {
-		ASSERT(0);
+		ASSERT_WARN(0);
 		return -1; /* Unsupported */
 	}
 }
@@ -516,7 +516,7 @@ static enum lb_memory_config dpp401_dscl_find_lb_memory_config(struct dcn401_dpp
 			scl_data, LB_MEMORY_CONFIG_0, &num_part_y, &num_part_c);
 
 	/*Ensure we can support the requested number of vtaps*/
-	ASSERT(dpp401_dscl_is_lb_conf_valid(ceil_vratio, num_part_y, vtaps)
+	ASSERT_WARN(dpp401_dscl_is_lb_conf_valid(ceil_vratio, num_part_y, vtaps)
 			&& dpp401_dscl_is_lb_conf_valid(ceil_vratio_c, num_part_c, vtaps_c));
 
 	return LB_MEMORY_CONFIG_0;
diff --git a/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c b/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
index d9aaebfa3a0a..dce367bbf28c 100644
--- a/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
+++ b/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
@@ -117,7 +117,7 @@ uint32_t dc_bandwidth_in_kbps_from_timing(
 		bits_per_channel = 16;
 		break;
 	default:
-		ASSERT(bits_per_channel != 0);
+		ASSERT_WARN(bits_per_channel != 0);
 		bits_per_channel = 8;
 		break;
 	}
@@ -433,7 +433,7 @@ bool dc_dsc_parse_dsc_dpcd(const struct dc *dc,
 
 	dsc_sink_caps->branch_max_line_width =
 		dpcd_dsc_branch_decoder_caps[DP_DSC_BRANCH_MAX_LINE_WIDTH - DP_DSC_BRANCH_OVERALL_THROUGHPUT_0] * 320;
-	ASSERT(dsc_sink_caps->branch_max_line_width == 0 || dsc_sink_caps->branch_max_line_width >= 5120);
+	ASSERT_WARN(dsc_sink_caps->branch_max_line_width == 0 || dsc_sink_caps->branch_max_line_width >= 5120);
 
 	dsc_sink_caps->is_dp = true;
 	return true;
diff --git a/drivers/gpu/drm/amd/display/dc/dsc/dcn20/dcn20_dsc.c b/drivers/gpu/drm/amd/display/dc/dsc/dcn20/dcn20_dsc.c
index 75128fd34306..f9824c446049 100644
--- a/drivers/gpu/drm/amd/display/dc/dsc/dcn20/dcn20_dsc.c
+++ b/drivers/gpu/drm/amd/display/dc/dsc/dcn20/dcn20_dsc.c
@@ -195,7 +195,7 @@ void dsc2_set_config(struct display_stream_compressor *dsc, const struct dsc_con
 	DC_LOG_DSC("Setting DSC Config at DSC inst %d", dsc->inst);
 	dsc_config_log(dsc, dsc_cfg);
 	is_config_ok = dsc_prepare_config(dsc_cfg, &dsc20->reg_vals, dsc_optc_cfg);
-	ASSERT(is_config_ok);
+	ASSERT_WARN(is_config_ok);
 	DC_LOG_DSC("programming DSC Picture Parameter Set (PPS):");
 	dsc_log_pps(dsc, &dsc20->reg_vals.pps);
 	dsc_write_to_registers(dsc, &dsc20->reg_vals);
@@ -215,7 +215,7 @@ bool dsc2_get_packed_pps(struct display_stream_compressor *dsc, const struct dsc
 	dsc_config_log(dsc, dsc_cfg);
 	DC_LOG_DSC("DSC Picture Parameter Set (PPS):");
 	is_config_ok = dsc_prepare_config(dsc_cfg, &dsc_reg_vals, &dsc_optc_cfg);
-	ASSERT(is_config_ok);
+	ASSERT_WARN(is_config_ok);
 	drm_dsc_pps_payload_pack((struct drm_dsc_picture_parameter_set *)dsc_packed_pps, &dsc_reg_vals.pps);
 	dsc_log_pps(dsc, &dsc_reg_vals.pps);
 
@@ -236,7 +236,7 @@ void dsc2_enable(struct display_stream_compressor *dsc, int opp_pipe)
 	REG_GET_2(DSCRM_DSC_FORWARD_CONFIG, DSCRM_DSC_FORWARD_EN, &dsc_fw_config, DSCRM_DSC_OPP_PIPE_SOURCE, &enabled_opp_pipe);
 	if ((dsc_clock_en || dsc_fw_config) && enabled_opp_pipe != opp_pipe) {
 		DC_LOG_DSC("ERROR: DSC %d at opp pipe %d already enabled!", dsc->inst, enabled_opp_pipe);
-		ASSERT(0);
+		ASSERT_WARN(0);
 	}
 
 	REG_UPDATE(DSC_TOP_CONTROL,
@@ -373,17 +373,17 @@ bool dsc_prepare_config(const struct dsc_config *dsc_cfg, struct dsc_reg_values
 	struct rc_params rc;
 
 	/* Validate input parameters */
-	ASSERT(dsc_cfg->dc_dsc_cfg.num_slices_h);
-	ASSERT(dsc_cfg->dc_dsc_cfg.num_slices_v);
-	ASSERT(dsc_cfg->dc_dsc_cfg.version_minor == 1 || dsc_cfg->dc_dsc_cfg.version_minor == 2);
-	ASSERT(dsc_cfg->pic_width);
-	ASSERT(dsc_cfg->pic_height);
-	ASSERT((dsc_cfg->dc_dsc_cfg.version_minor == 1 &&
+	ASSERT_WARN(dsc_cfg->dc_dsc_cfg.num_slices_h);
+	ASSERT_WARN(dsc_cfg->dc_dsc_cfg.num_slices_v);
+	ASSERT_WARN(dsc_cfg->dc_dsc_cfg.version_minor == 1 || dsc_cfg->dc_dsc_cfg.version_minor == 2);
+	ASSERT_WARN(dsc_cfg->pic_width);
+	ASSERT_WARN(dsc_cfg->pic_height);
+	ASSERT_WARN((dsc_cfg->dc_dsc_cfg.version_minor == 1 &&
 		  (8 <= dsc_cfg->dc_dsc_cfg.linebuf_depth && dsc_cfg->dc_dsc_cfg.linebuf_depth <= 13)) ||
 		(dsc_cfg->dc_dsc_cfg.version_minor == 2 &&
 		  ((8 <= dsc_cfg->dc_dsc_cfg.linebuf_depth && dsc_cfg->dc_dsc_cfg.linebuf_depth <= 15) ||
 		    dsc_cfg->dc_dsc_cfg.linebuf_depth == 0)));
-	ASSERT(96 <= dsc_cfg->dc_dsc_cfg.bits_per_pixel && dsc_cfg->dc_dsc_cfg.bits_per_pixel <= 0x3ff); // 6.0 <= bits_per_pixel <= 63.9375
+	ASSERT_WARN(96 <= dsc_cfg->dc_dsc_cfg.bits_per_pixel && dsc_cfg->dc_dsc_cfg.bits_per_pixel <= 0x3ff); // 6.0 <= bits_per_pixel <= 63.9375
 
 	if (!dsc_cfg->dc_dsc_cfg.num_slices_v || !dsc_cfg->dc_dsc_cfg.num_slices_h ||
 		!(dsc_cfg->dc_dsc_cfg.version_minor == 1 || dsc_cfg->dc_dsc_cfg.version_minor == 2) ||
@@ -418,7 +418,7 @@ bool dsc_prepare_config(const struct dsc_config *dsc_cfg, struct dsc_reg_values
 	dsc_reg_vals->pps.slice_width = dsc_cfg->pic_width / dsc_cfg->dc_dsc_cfg.num_slices_h;
 	dsc_reg_vals->pps.slice_height = dsc_cfg->pic_height / dsc_cfg->dc_dsc_cfg.num_slices_v;
 
-	ASSERT(dsc_reg_vals->pps.slice_height * dsc_cfg->dc_dsc_cfg.num_slices_v == dsc_cfg->pic_height);
+	ASSERT_WARN(dsc_reg_vals->pps.slice_height * dsc_cfg->dc_dsc_cfg.num_slices_v == dsc_cfg->pic_height);
 	if (!(dsc_reg_vals->pps.slice_height * dsc_cfg->dc_dsc_cfg.num_slices_v == dsc_cfg->pic_height)) {
 		dm_output_to_console("%s: pix height %d not divisible by num_slices_v %d\n\n", __func__, dsc_cfg->pic_height, dsc_cfg->dc_dsc_cfg.num_slices_v);
 		return false;
@@ -484,7 +484,7 @@ enum dsc_pixel_format dsc_dc_pixel_encoding_to_dsc_pixel_format(enum dc_pixel_en
 		break;
 	}
 
-	ASSERT(dsc_pix_fmt != DSC_PIXFMT_UNKNOWN);
+	ASSERT_WARN(dsc_pix_fmt != DSC_PIXFMT_UNKNOWN);
 	return dsc_pix_fmt;
 }
 
diff --git a/drivers/gpu/drm/amd/display/dc/dsc/dcn35/dcn35_dsc.c b/drivers/gpu/drm/amd/display/dc/dsc/dcn35/dcn35_dsc.c
index 6f4f5a3c4861..80bca9e96d8a 100644
--- a/drivers/gpu/drm/amd/display/dc/dsc/dcn35/dcn35_dsc.c
+++ b/drivers/gpu/drm/amd/display/dc/dsc/dcn35/dcn35_dsc.c
@@ -95,7 +95,7 @@ static void dsc35_enable(struct display_stream_compressor *dsc, int opp_pipe)
 	REG_GET_2(DSCRM_DSC_FORWARD_CONFIG, DSCRM_DSC_FORWARD_EN, &dsc_fw_config, DSCRM_DSC_OPP_PIPE_SOURCE, &enabled_opp_pipe);
 	if ((dsc_clock_en || dsc_fw_config) && enabled_opp_pipe != opp_pipe) {
 		DC_LOG_DSC("ERROR: DSC %d at opp pipe %d already enabled!", dsc->inst, enabled_opp_pipe);
-		ASSERT(0);
+		ASSERT_WARN(0);
 	}
 
 	REG_UPDATE(DSC_TOP_CONTROL,
diff --git a/drivers/gpu/drm/amd/display/dc/dsc/dcn401/dcn401_dsc.c b/drivers/gpu/drm/amd/display/dc/dsc/dcn401/dcn401_dsc.c
index 61678b0a5a1e..47e2f7e1caf6 100644
--- a/drivers/gpu/drm/amd/display/dc/dsc/dcn401/dcn401_dsc.c
+++ b/drivers/gpu/drm/amd/display/dc/dsc/dcn401/dcn401_dsc.c
@@ -154,7 +154,7 @@ static void dsc401_set_config(struct display_stream_compressor *dsc, const struc
 	DC_LOG_DSC("Setting DSC Config at DSC inst %d", dsc->inst);
 	dsc_config_log(dsc, dsc_cfg);
 	is_config_ok = dsc_prepare_config(dsc_cfg, &dsc401->reg_vals, dsc_optc_cfg);
-	ASSERT(is_config_ok);
+	ASSERT_WARN(is_config_ok);
 	DC_LOG_DSC("programming DSC Picture Parameter Set (PPS):");
 	dsc_log_pps(dsc, &dsc401->reg_vals.pps);
 	dsc_write_to_registers(dsc, &dsc401->reg_vals);
@@ -173,7 +173,7 @@ static void dsc401_enable(struct display_stream_compressor *dsc, int opp_pipe)
 	REG_GET_2(DSCRM_DSC_FORWARD_CONFIG, DSCRM_DSC_FORWARD_EN, &dsc_fw_config, DSCRM_DSC_OPP_PIPE_SOURCE, &enabled_opp_pipe);
 	if ((dsc_clock_en || dsc_fw_config) && enabled_opp_pipe != opp_pipe) {
 		DC_LOG_DSC("ERROR: DSC %d at opp pipe %d already enabled!", dsc->inst, enabled_opp_pipe);
-		ASSERT(0);
+		ASSERT_WARN(0);
 	}
 
 	REG_UPDATE(DSC_TOP_CONTROL,
diff --git a/drivers/gpu/drm/amd/display/dc/gpio/hw_gpio.c b/drivers/gpu/drm/amd/display/dc/gpio/hw_gpio.c
index 660510842ecf..3b1b9ec248d9 100644
--- a/drivers/gpu/drm/amd/display/dc/gpio/hw_gpio.c
+++ b/drivers/gpu/drm/amd/display/dc/gpio/hw_gpio.c
@@ -199,5 +199,5 @@ void dal_hw_gpio_construct(
 void dal_hw_gpio_destruct(
 	struct hw_gpio *pin)
 {
-	ASSERT(!pin->base.opened);
+	ASSERT_WARN(!pin->base.opened);
 }
diff --git a/drivers/gpu/drm/amd/display/dc/hpo/dcn31/dcn31_hpo_dp_link_encoder.c b/drivers/gpu/drm/amd/display/dc/hpo/dcn31/dcn31_hpo_dp_link_encoder.c
index 03b4ac2f1991..0fc5e14707e8 100644
--- a/drivers/gpu/drm/amd/display/dc/hpo/dcn31/dcn31_hpo_dp_link_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/hpo/dcn31/dcn31_hpo_dp_link_encoder.c
@@ -423,7 +423,7 @@ void dcn31_hpo_dp_link_enc_set_throttled_vcp_size(
 				STREAM_VC_RATE_Y, y);
 		break;
 	default:
-		ASSERT(0);
+		ASSERT_WARN(0);
 	}
 
 	/* Best case and worst case wait time for RATE_UPDATE_PENDING
@@ -442,7 +442,7 @@ static bool dcn31_hpo_dp_link_enc_is_in_alt_mode(
 	struct dcn31_hpo_dp_link_encoder *enc3 = DCN3_1_HPO_DP_LINK_ENC_FROM_HPO_LINK_ENC(enc);
 	uint32_t dp_alt_mode_disable = 0;
 
-	ASSERT((enc->transmitter >= TRANSMITTER_UNIPHY_A) && (enc->transmitter <= TRANSMITTER_UNIPHY_E));
+	ASSERT_WARN((enc->transmitter >= TRANSMITTER_UNIPHY_A) && (enc->transmitter <= TRANSMITTER_UNIPHY_E));
 
 	/* if value == 1 alt mode is disabled, otherwise it is enabled */
 	REG_GET(RDPCSTX_PHY_CNTL6[enc->transmitter], RDPCS_PHY_DPALT_DISABLE, &dp_alt_mode_disable);
@@ -455,7 +455,7 @@ void dcn31_hpo_dp_link_enc_read_state(
 {
 	struct dcn31_hpo_dp_link_encoder *enc3 = DCN3_1_HPO_DP_LINK_ENC_FROM_HPO_LINK_ENC(enc);
 
-	ASSERT(state);
+	ASSERT_WARN(state);
 
 	REG_GET(DP_DPHY_SYM32_STATUS,
 			STATUS, &state->link_enc_enabled);
diff --git a/drivers/gpu/drm/amd/display/dc/hpo/dcn31/dcn31_hpo_dp_stream_encoder.c b/drivers/gpu/drm/amd/display/dc/hpo/dcn31/dcn31_hpo_dp_stream_encoder.c
index 678db949cfe3..c6b8bdde3e02 100644
--- a/drivers/gpu/drm/amd/display/dc/hpo/dcn31/dcn31_hpo_dp_stream_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/hpo/dcn31/dcn31_hpo_dp_stream_encoder.c
@@ -606,7 +606,7 @@ static void dcn31_hpo_dp_stream_enc_map_stream_to_link(
 {
 	struct dcn31_hpo_dp_stream_encoder *enc3 = DCN3_1_HPO_DP_STREAM_ENC_FROM_HPO_STREAM_ENC(enc);
 
-	ASSERT(stream_enc_inst < 4 && link_enc_inst < 2);
+	ASSERT_WARN(stream_enc_inst < 4 && link_enc_inst < 2);
 
 	switch (stream_enc_inst) {
 	case 0:
@@ -639,7 +639,7 @@ static void dcn31_hpo_dp_stream_enc_audio_setup(
 	REG_UPDATE(DP_STREAM_ENC_AUDIO_CONTROL,
 			DP_STREAM_ENC_INPUT_MUX_AUDIO_STREAM_SOURCE_SEL, az_inst);
 
-	ASSERT(enc->apg);
+	ASSERT_WARN(enc->apg);
 	enc->apg->funcs->se_audio_setup(enc->apg, az_inst, info);
 }
 
diff --git a/drivers/gpu/drm/amd/display/dc/hpo/dcn32/dcn32_hpo_dp_link_encoder.c b/drivers/gpu/drm/amd/display/dc/hpo/dcn32/dcn32_hpo_dp_link_encoder.c
index 8af01f579690..451b27e52c96 100644
--- a/drivers/gpu/drm/amd/display/dc/hpo/dcn32/dcn32_hpo_dp_link_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/hpo/dcn32/dcn32_hpo_dp_link_encoder.c
@@ -47,7 +47,7 @@ static bool dcn32_hpo_dp_link_enc_is_in_alt_mode(
 	struct dcn31_hpo_dp_link_encoder *enc3 = DCN3_1_HPO_DP_LINK_ENC_FROM_HPO_LINK_ENC(enc);
 	uint32_t dp_alt_mode_disable = 0;
 
-	ASSERT((enc->transmitter >= TRANSMITTER_UNIPHY_A) && (enc->transmitter <= TRANSMITTER_UNIPHY_E));
+	ASSERT_WARN((enc->transmitter >= TRANSMITTER_UNIPHY_A) && (enc->transmitter <= TRANSMITTER_UNIPHY_E));
 
 	/* if value == 1 alt mode is disabled, otherwise it is enabled */
 	REG_GET(RDPCSTX_PHY_CNTL6[enc->transmitter], RDPCS_PHY_DPALT_DISABLE, &dp_alt_mode_disable);
diff --git a/drivers/gpu/drm/amd/display/dc/hubbub/dcn10/dcn10_hubbub.c b/drivers/gpu/drm/amd/display/dc/hubbub/dcn10/dcn10_hubbub.c
index d738a36f2132..ba82fbc703e0 100644
--- a/drivers/gpu/drm/amd/display/dc/hubbub/dcn10/dcn10_hubbub.c
+++ b/drivers/gpu/drm/amd/display/dc/hubbub/dcn10/dcn10_hubbub.c
@@ -623,7 +623,7 @@ void hubbub1_update_dchub(
 	struct dcn10_hubbub *hubbub1 = TO_DCN10_HUBBUB(hubbub);
 
 	if (REG(DCHUBBUB_SDPIF_FB_TOP) == 0) {
-		ASSERT(false);
+		ASSERT_WARN(false);
 		/*should not come here*/
 		return;
 	}
@@ -919,7 +919,7 @@ static bool hubbub1_get_dcc_compression_cap(struct hubbub *hubbub,
 		output->grph.rgb.independent_64b_blks = true;
 		break;
 	default:
-		ASSERT(false);
+		ASSERT_WARN(false);
 		break;
 	}
 
diff --git a/drivers/gpu/drm/amd/display/dc/hubbub/dcn20/dcn20_hubbub.c b/drivers/gpu/drm/amd/display/dc/hubbub/dcn20/dcn20_hubbub.c
index 5c6f7ddafd6b..dfb2e674116c 100644
--- a/drivers/gpu/drm/amd/display/dc/hubbub/dcn20/dcn20_hubbub.c
+++ b/drivers/gpu/drm/amd/display/dc/hubbub/dcn20/dcn20_hubbub.c
@@ -297,7 +297,7 @@ bool hubbub2_get_dcc_compression_cap(struct hubbub *hubbub,
 		output->grph.rgb.independent_64b_blks = true;
 		break;
 	default:
-		ASSERT(false);
+		ASSERT_WARN(false);
 		break;
 	}
 	output->capable = true;
@@ -324,7 +324,7 @@ static enum dcn_hubbub_page_table_depth page_table_depth_to_hw(unsigned int page
 		depth = DCN_PAGE_TABLE_DEPTH_4_LEVEL;
 		break;
 	default:
-		ASSERT(false);
+		ASSERT_WARN(false);
 		break;
 	}
 
@@ -367,7 +367,7 @@ static enum dcn_hubbub_page_table_block_size page_table_block_size_to_hw(unsigne
 		block_size = DCN_PAGE_TABLE_BLOCK_SIZE_2048KB;
 		break;
 	default:
-		ASSERT(false);
+		ASSERT_WARN(false);
 		block_size = DCN_PAGE_TABLE_BLOCK_SIZE_4KB;
 		break;
 	}
diff --git a/drivers/gpu/drm/amd/display/dc/hubbub/dcn31/dcn31_hubbub.c b/drivers/gpu/drm/amd/display/dc/hubbub/dcn31/dcn31_hubbub.c
index 7fb5523f9722..66f5b8ea50cf 100644
--- a/drivers/gpu/drm/amd/display/dc/hubbub/dcn31/dcn31_hubbub.c
+++ b/drivers/gpu/drm/amd/display/dc/hubbub/dcn31/dcn31_hubbub.c
@@ -105,7 +105,7 @@ static void dcn31_program_det_size(struct hubbub *hubbub, int hubp_inst, unsigne
 	}
 	DC_LOG_DEBUG("Set DET%d to %d segments\n", hubp_inst, det_size_segments);
 	/* Should never be hit, if it is we have an erroneous hw config*/
-	ASSERT(hubbub2->det0_size + hubbub2->det1_size + hubbub2->det2_size
+	ASSERT_WARN(hubbub2->det0_size + hubbub2->det1_size + hubbub2->det2_size
 			+ hubbub2->det3_size + hubbub2->compbuf_size_segments <= hubbub2->crb_size_segs);
 }
 
@@ -144,11 +144,11 @@ static void dcn31_program_compbuf_size(struct hubbub *hubbub, unsigned int compb
 			REG_WAIT(DCHUBBUB_DET3_CTRL, DET3_SIZE_CURRENT, hubbub2->det3_size, 1, 100);
 		}
 		/* Should never be hit, if it is we have an erroneous hw config*/
-		ASSERT(hubbub2->det0_size + hubbub2->det1_size + hubbub2->det2_size
+		ASSERT_WARN(hubbub2->det0_size + hubbub2->det1_size + hubbub2->det2_size
 				+ hubbub2->det3_size + compbuf_size_segments <= hubbub2->crb_size_segs);
 		REG_UPDATE(DCHUBBUB_COMPBUF_CTRL, COMPBUF_SIZE, compbuf_size_segments);
 		hubbub2->compbuf_size_segments = compbuf_size_segments;
-		ASSERT(REG_GET(DCHUBBUB_COMPBUF_CTRL, CONFIG_ERROR, &compbuf_size_segments) && !compbuf_size_segments);
+		ASSERT_WARN(REG_GET(DCHUBBUB_COMPBUF_CTRL, CONFIG_ERROR, &compbuf_size_segments) && !compbuf_size_segments);
 	}
 }
 
@@ -163,7 +163,7 @@ static uint32_t convert_and_clamp(
 
 	if (ret_val > clamp_value) {
 		/* clamping WMs is abnormal, unexpected and may lead to underflow*/
-		ASSERT(0);
+		ASSERT_WARN(0);
 		ret_val = clamp_value;
 	}
 
diff --git a/drivers/gpu/drm/amd/display/dc/hubbub/dcn32/dcn32_hubbub.c b/drivers/gpu/drm/amd/display/dc/hubbub/dcn32/dcn32_hubbub.c
index 5264dc26cce1..9a492db0af5f 100644
--- a/drivers/gpu/drm/amd/display/dc/hubbub/dcn32/dcn32_hubbub.c
+++ b/drivers/gpu/drm/amd/display/dc/hubbub/dcn32/dcn32_hubbub.c
@@ -78,8 +78,8 @@ void hubbub32_set_request_limit(struct hubbub *hubbub, int memory_channel_count,
 
 	uint32_t request_limit = 3 * memory_channel_count * words_per_channel / 4;
 
-	ASSERT((request_limit & (~0xFFF)) == 0); //field is only 24 bits long
-	ASSERT(request_limit > 0); //field is only 24 bits long
+	ASSERT_WARN((request_limit & (~0xFFF)) == 0); //field is only 24 bits long
+	ASSERT_WARN(request_limit > 0); //field is only 24 bits long
 
 	if (request_limit > 0xFFF)
 		request_limit = 0xFFF;
@@ -141,11 +141,11 @@ void dcn32_program_compbuf_size(struct hubbub *hubbub, unsigned int compbuf_size
 			REG_WAIT(DCHUBBUB_DET3_CTRL, DET3_SIZE_CURRENT, hubbub2->det3_size, 1, 100);
 		}
 		/* Should never be hit, if it is we have an erroneous hw config*/
-		ASSERT(hubbub2->det0_size + hubbub2->det1_size + hubbub2->det2_size
+		ASSERT_WARN(hubbub2->det0_size + hubbub2->det1_size + hubbub2->det2_size
 				+ hubbub2->det3_size + compbuf_size_segments <= hubbub2->crb_size_segs);
 		REG_UPDATE(DCHUBBUB_COMPBUF_CTRL, COMPBUF_SIZE, compbuf_size_segments);
 		hubbub2->compbuf_size_segments = compbuf_size_segments;
-		ASSERT(REG_GET(DCHUBBUB_COMPBUF_CTRL, CONFIG_ERROR, &compbuf_size_segments) && !compbuf_size_segments);
+		ASSERT_WARN(REG_GET(DCHUBBUB_COMPBUF_CTRL, CONFIG_ERROR, &compbuf_size_segments) && !compbuf_size_segments);
 	}
 }
 
diff --git a/drivers/gpu/drm/amd/display/dc/hubbub/dcn35/dcn35_hubbub.c b/drivers/gpu/drm/amd/display/dc/hubbub/dcn35/dcn35_hubbub.c
index 5eb3da8d5206..4e450d3c5c79 100644
--- a/drivers/gpu/drm/amd/display/dc/hubbub/dcn35/dcn35_hubbub.c
+++ b/drivers/gpu/drm/amd/display/dc/hubbub/dcn35/dcn35_hubbub.c
@@ -84,11 +84,11 @@ static void dcn35_program_compbuf_size(struct hubbub *hubbub, unsigned int compb
 			REG_WAIT(DCHUBBUB_DET3_CTRL, DET3_SIZE_CURRENT, hubbub2->det3_size, 1, 100);
 		}
 		/* Should never be hit, if it is we have an erroneous hw config*/
-		ASSERT(hubbub2->det0_size + hubbub2->det1_size + hubbub2->det2_size
+		ASSERT_WARN(hubbub2->det0_size + hubbub2->det1_size + hubbub2->det2_size
 				+ hubbub2->det3_size + compbuf_size_segments <= hubbub2->crb_size_segs);
 		REG_UPDATE(DCHUBBUB_COMPBUF_CTRL, COMPBUF_SIZE, compbuf_size_segments);
 		hubbub2->compbuf_size_segments = compbuf_size_segments;
-		ASSERT(REG_GET(DCHUBBUB_COMPBUF_CTRL, CONFIG_ERROR, &compbuf_size_segments) && !compbuf_size_segments);
+		ASSERT_WARN(REG_GET(DCHUBBUB_COMPBUF_CTRL, CONFIG_ERROR, &compbuf_size_segments) && !compbuf_size_segments);
 	}
 }
 
@@ -556,8 +556,8 @@ static void hubbub35_init(struct hubbub *hubbub)
 
 	uint32_t request_limit = 3 * memory_channel_count * words_per_channel / 4;
 
-	ASSERT((request_limit & (~0xFFF)) == 0); //field is only 24 bits long
-	ASSERT(request_limit > 0); //field is only 24 bits long
+	ASSERT_WARN((request_limit & (~0xFFF)) == 0); //field is only 24 bits long
+	ASSERT_WARN(request_limit > 0); //field is only 24 bits long
 
 	if (request_limit > 0xFFF)
 		request_limit = 0xFFF;
diff --git a/drivers/gpu/drm/amd/display/dc/hubbub/dcn401/dcn401_hubbub.c b/drivers/gpu/drm/amd/display/dc/hubbub/dcn401/dcn401_hubbub.c
index 92fab471b183..4a56bae94216 100644
--- a/drivers/gpu/drm/amd/display/dc/hubbub/dcn401/dcn401_hubbub.c
+++ b/drivers/gpu/drm/amd/display/dc/hubbub/dcn401/dcn401_hubbub.c
@@ -987,7 +987,7 @@ bool hubbub401_get_dcc_compression_cap(struct hubbub *hubbub,
 			break;
 		default:
 			/* Shouldn't get here */
-			ASSERT(0);
+			ASSERT_WARN(0);
 			break;
 		}
 	} else {
@@ -1052,7 +1052,7 @@ bool hubbub401_get_dcc_compression_cap(struct hubbub *hubbub,
 			output->video.luma.dcc_controls.dcc_256_64 = 1;
 			break;
 		default:
-			ASSERT(0);
+			ASSERT_WARN(0);
 			break;
 		}
 
@@ -1101,7 +1101,7 @@ bool hubbub401_get_dcc_compression_cap(struct hubbub *hubbub,
 			output->video.chroma.dcc_controls.dcc_256_64 = 1;
 			break;
 		default:
-			ASSERT(0);
+			ASSERT_WARN(0);
 			break;
 		}
 	}
@@ -1161,12 +1161,12 @@ static void dcn401_program_compbuf_segments(struct hubbub *hubbub, unsigned comp
 			REG_WAIT(DCHUBBUB_DET3_CTRL, DET3_SIZE_CURRENT, hubbub2->det3_size, 1, 100);
 		}
 		/* Should never be hit, if it is we have an erroneous hw config*/
-		ASSERT(hubbub2->det0_size + hubbub2->det1_size + hubbub2->det2_size
+		ASSERT_WARN(hubbub2->det0_size + hubbub2->det1_size + hubbub2->det2_size
 				+ hubbub2->det3_size + compbuf_size_seg <= hubbub2->crb_size_segs);
 		REG_UPDATE(DCHUBBUB_COMPBUF_CTRL, COMPBUF_SIZE, compbuf_size_seg);
 		hubbub2->compbuf_size_segments = compbuf_size_seg;
 
-		ASSERT(REG_GET(DCHUBBUB_COMPBUF_CTRL, CONFIG_ERROR, &cur_compbuf_size_seg) && !cur_compbuf_size_seg);
+		ASSERT_WARN(REG_GET(DCHUBBUB_COMPBUF_CTRL, CONFIG_ERROR, &cur_compbuf_size_seg) && !cur_compbuf_size_seg);
 	}
 }
 
diff --git a/drivers/gpu/drm/amd/display/dc/hubp/dcn10/dcn10_hubp.c b/drivers/gpu/drm/amd/display/dc/hubp/dcn10/dcn10_hubp.c
index 22ac2b7e49ae..9ef2a79e920e 100644
--- a/drivers/gpu/drm/amd/display/dc/hubp/dcn10/dcn10_hubp.c
+++ b/drivers/gpu/drm/amd/display/dc/hubp/dcn10/dcn10_hubp.c
@@ -173,7 +173,7 @@ void hubp1_program_size(
 	 * 444 or 420 luma
 	 */
 	if (format >= SURFACE_PIXEL_FORMAT_VIDEO_BEGIN && format < SURFACE_PIXEL_FORMAT_SUBSAMPLE_END) {
-		ASSERT(plane_size->chroma_pitch != 0);
+		ASSERT_WARN(plane_size->chroma_pitch != 0);
 		/* Chroma pitch zero can cause system hang! */
 
 		pitch = plane_size->surface_pitch - 1;
@@ -1229,7 +1229,7 @@ void hubp1_cursor_set_position(
 	dst_x_offset *= param->ref_clk_khz;
 	dst_x_offset /= param->pixel_clk_khz;
 
-	ASSERT(param->h_scale_ratio.value);
+	ASSERT_WARN(param->h_scale_ratio.value);
 
 	if (param->h_scale_ratio.value)
 		dst_x_offset = dc_fixpt_floor(dc_fixpt_div(
diff --git a/drivers/gpu/drm/amd/display/dc/hubp/dcn20/dcn20_hubp.c b/drivers/gpu/drm/amd/display/dc/hubp/dcn20/dcn20_hubp.c
index 0637e4c552d8..735a6a8cc865 100644
--- a/drivers/gpu/drm/amd/display/dc/hubp/dcn20/dcn20_hubp.c
+++ b/drivers/gpu/drm/amd/display/dc/hubp/dcn20/dcn20_hubp.c
@@ -343,7 +343,7 @@ void hubp2_program_size(
 	use_pitch_c = use_pitch_c
 		|| (format == SURFACE_PIXEL_FORMAT_GRPH_RGBE_ALPHA);
 	if (use_pitch_c) {
-		ASSERT(plane_size->chroma_pitch != 0);
+		ASSERT_WARN(plane_size->chroma_pitch != 0);
 		/* Chroma pitch zero can cause system hang! */
 
 		pitch = plane_size->surface_pitch - 1;
@@ -1025,7 +1025,7 @@ void hubp2_cursor_set_position(
 	dst_x_offset *= param->ref_clk_khz;
 	dst_x_offset /= param->pixel_clk_khz;
 
-	ASSERT(param->h_scale_ratio.value);
+	ASSERT_WARN(param->h_scale_ratio.value);
 
 	if (param->h_scale_ratio.value)
 		dst_x_offset = dc_fixpt_floor(dc_fixpt_div(
diff --git a/drivers/gpu/drm/amd/display/dc/hubp/dcn401/dcn401_hubp.c b/drivers/gpu/drm/amd/display/dc/hubp/dcn401/dcn401_hubp.c
index b1ebf5053b4f..97966fcc3fc7 100644
--- a/drivers/gpu/drm/amd/display/dc/hubp/dcn401/dcn401_hubp.c
+++ b/drivers/gpu/drm/amd/display/dc/hubp/dcn401/dcn401_hubp.c
@@ -549,7 +549,7 @@ void hubp401_program_size(
 	use_pitch_c = use_pitch_c
 		|| (format == SURFACE_PIXEL_FORMAT_GRPH_RGBE_ALPHA);
 	if (use_pitch_c) {
-		ASSERT(plane_size->chroma_pitch != 0);
+		ASSERT_WARN(plane_size->chroma_pitch != 0);
 		/* Chroma pitch zero can cause system hang! */
 
 		pitch = plane_size->surface_pitch - 1;
@@ -690,8 +690,8 @@ void hubp401_cursor_set_position(
 		x_pos_viewport = x_pos * param->viewport.width / param->recout.width;
 		x_hot_viewport = pos->x_hotspot * param->viewport.width / param->recout.width;
 	} else {
-		ASSERT(!cur_en || x_pos == 0);
-		ASSERT(!cur_en || pos->x_hotspot == 0);
+		ASSERT_WARN(!cur_en || x_pos == 0);
+		ASSERT_WARN(!cur_en || pos->x_hotspot == 0);
 	}
 
 	/*
@@ -711,7 +711,7 @@ void hubp401_cursor_set_position(
 	dst_x_offset *= param->ref_clk_khz;
 	dst_x_offset /= param->pixel_clk_khz;
 
-	ASSERT(param->h_scale_ratio.value);
+	ASSERT_WARN(param->h_scale_ratio.value);
 
 	if (param->h_scale_ratio.value)
 		dst_x_offset = dc_fixpt_floor(dc_fixpt_div(
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
index 81f4c386c287..b169421e25cd 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
@@ -273,7 +273,7 @@ static void dce110_prescale_params(struct ipp_prescale_params *prescale_params,
 		prescale_params->scale = 0x2000;
 		break;
 	default:
-		ASSERT(false);
+		ASSERT_WARN(false);
 		break;
 	}
 }
@@ -631,7 +631,7 @@ void dce110_update_info_frame(struct pipe_ctx *pipe_ctx)
 	bool is_hdmi_tmds;
 	bool is_dp;
 
-	ASSERT(pipe_ctx->stream);
+	ASSERT_WARN(pipe_ctx->stream);
 
 	if (pipe_ctx->stream_res.stream_enc == NULL)
 		return;  /* this is not root pipe */
@@ -2167,7 +2167,7 @@ static bool should_enable_fbc(struct dc *dc,
 	unsigned int underlay_idx = dc->res_pool->underlay_pipe_index;
 
 
-	ASSERT(dc->fbc_compressor);
+	ASSERT_WARN(dc->fbc_compressor);
 
 	/* FBC memory should be allocated */
 	if (!dc->ctx->fbc_gpu_addr)
@@ -2559,7 +2559,7 @@ static void program_surface_visibility(const struct dc *dc,
 	if (pipe_ctx->bottom_pipe) {
 
 		/* For now we are supporting only two pipes */
-		ASSERT(pipe_ctx->bottom_pipe->bottom_pipe == NULL);
+		ASSERT_WARN(pipe_ctx->bottom_pipe->bottom_pipe == NULL);
 
 		if (pipe_ctx->bottom_pipe->plane_state->visible) {
 			if (pipe_ctx->plane_state->visible)
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
index 681bb92c6069..3352baabf7b1 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
@@ -2745,7 +2745,7 @@ void dcn10_update_mpcc(struct dc *dc, struct pipe_ctx *pipe_ctx)
 			mpcc_id);
 	dc->hwss.update_visual_confirm_color(dc, pipe_ctx, mpcc_id);
 
-	ASSERT(new_mpcc != NULL);
+	ASSERT_WARN(new_mpcc != NULL);
 	hubp->opp_id = pipe_ctx->stream_res.opp->inst;
 	hubp->mpcc_id = mpcc_id;
 }
@@ -3337,7 +3337,7 @@ static struct hubp *get_hubp_by_inst(struct resource_pool *res_pool, int mpcc_in
 		if (res_pool->hubps[i]->inst == mpcc_inst)
 			return res_pool->hubps[i];
 	}
-	ASSERT(false);
+	ASSERT_WARN(false);
 	return NULL;
 }
 
@@ -3837,7 +3837,7 @@ static void dcn10_cal_vline_position(
 		*start_line = vline_pos;
 		*end_line = (*start_line + 2) % timing->v_total;
 	} else
-		ASSERT(0);
+		ASSERT_WARN(0);
 }
 
 void dcn10_setup_periodic_interrupt(
@@ -3859,7 +3859,7 @@ void dcn10_setup_vupdate_interrupt(struct dc *dc, struct pipe_ctx *pipe_ctx)
 	int start_line = dc->hwss.get_vupdate_offset_from_vsync(pipe_ctx);
 
 	if (start_line < 0) {
-		ASSERT(0);
+		ASSERT_WARN(0);
 		start_line = 0;
 	}
 
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
index b029ec1b26d3..38fbe19bbb93 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
@@ -222,7 +222,7 @@ void dcn20_setup_gsl_group_as_lock(
 			return;
 
 		group_idx = find_free_gsl_group(dc);
-		ASSERT(group_idx != 0);
+		ASSERT_WARN(group_idx != 0);
 		pipe_ctx->stream_res.gsl_group = group_idx;
 
 		/* set gsl group reg field and mark resource used */
@@ -418,7 +418,7 @@ void dcn20_init_blank(
 	tg->funcs->get_optc_source(tg, &num_opps, &opp_id_src0, &opp_id_src1);
 
 	if (opp_id_src0 >= dc->res_pool->res_cap->num_opp) {
-		ASSERT(false);
+		ASSERT_WARN(false);
 		return;
 	}
 	opp = dc->res_pool->opps[opp_id_src0];
@@ -431,7 +431,7 @@ void dcn20_init_blank(
 		otg_active_width = otg_active_width / 2;
 
 		if (opp_id_src1 >= dc->res_pool->res_cap->num_opp) {
-			ASSERT(false);
+			ASSERT_WARN(false);
 			return;
 		}
 		bottom_opp = dc->res_pool->opps[opp_id_src1];
@@ -1408,7 +1408,7 @@ void dcn20_pipe_control_lock(
 				}
 
 				/* no reason it should take this long for immediate flips */
-				ASSERT(i != TIMEOUT_FOR_FLIP_PENDING_US);
+				ASSERT_WARN(i != TIMEOUT_FOR_FLIP_PENDING_US);
 			}
 			temp_pipe = temp_pipe->bottom_pipe;
 		}
@@ -1739,7 +1739,7 @@ static void dcn20_update_dchubp_dpp(
 			plane_state->update_flags.bits.per_pixel_alpha_change ||
 			pipe_ctx->stream->update_flags.bits.scaling) {
 		pipe_ctx->plane_res.scl_data.lb_params.alpha_en = pipe_ctx->plane_state->per_pixel_alpha;
-		ASSERT(pipe_ctx->plane_res.scl_data.lb_params.depth == LB_PIXEL_DEPTH_36BPP);
+		ASSERT_WARN(pipe_ctx->plane_res.scl_data.lb_params.depth == LB_PIXEL_DEPTH_36BPP);
 		/* scaler configuration */
 		pipe_ctx->plane_res.dpp->funcs->dpp_set_scaler(
 				pipe_ctx->plane_res.dpp, &pipe_ctx->plane_res.scl_data);
@@ -2026,7 +2026,7 @@ void dcn20_program_front_end_for_ctx(
 			pipe = &context->res_ctx.pipe_ctx[i];
 
 			if (!pipe->top_pipe && !pipe->prev_odm_pipe && pipe->plane_state) {
-				ASSERT(!pipe->plane_state->triplebuffer_flips);
+				ASSERT_WARN(!pipe->plane_state->triplebuffer_flips);
 				/*turn off triple buffer for full update*/
 				dc->hwss.program_triplebuffer(
 						dc, pipe, pipe->plane_state->triplebuffer_flips);
@@ -2499,8 +2499,8 @@ void dcn20_enable_writeback(
 	struct mcif_wb *mcif_wb;
 	struct timing_generator *optc;
 
-	ASSERT(wb_info->dwb_pipe_inst < MAX_DWB_PIPES);
-	ASSERT(wb_info->wb_enabled);
+	ASSERT_WARN(wb_info->dwb_pipe_inst < MAX_DWB_PIPES);
+	ASSERT_WARN(wb_info->wb_enabled);
 	dwb = dc->res_pool->dwbc[wb_info->dwb_pipe_inst];
 	mcif_wb = dc->res_pool->mcif_wb[wb_info->dwb_pipe_inst];
 
@@ -2524,7 +2524,7 @@ void dcn20_disable_writeback(
 	struct dwbc *dwb;
 	struct mcif_wb *mcif_wb;
 
-	ASSERT(dwb_pipe_inst < MAX_DWB_PIPES);
+	ASSERT_WARN(dwb_pipe_inst < MAX_DWB_PIPES);
 	dwb = dc->res_pool->dwbc[dwb_pipe_inst];
 	mcif_wb = dc->res_pool->mcif_wb[dwb_pipe_inst];
 
@@ -2623,7 +2623,7 @@ void dcn20_init_vm_ctx(
 	struct dcn_hubbub_virt_addr_config config;
 
 	if (vmid == 0) {
-		ASSERT(0); /* VMID cannot be 0 for vm context */
+		ASSERT_WARN(0); /* VMID cannot be 0 for vm context */
 		return;
 	}
 
@@ -2957,7 +2957,7 @@ void dcn20_update_mpcc(struct dc *dc, struct pipe_ctx *pipe_ctx)
 			mpcc_id);
 	dc->hwss.update_visual_confirm_color(dc, pipe_ctx, mpcc_id);
 
-	ASSERT(new_mpcc != NULL);
+	ASSERT_WARN(new_mpcc != NULL);
 	hubp->opp_id = pipe_ctx->stream_res.opp->inst;
 	hubp->mpcc_id = mpcc_id;
 }
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn201/dcn201_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn201/dcn201_hwseq.c
index 1635e5a552ad..2f5d7498bcc4 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn201/dcn201_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn201/dcn201_hwseq.c
@@ -183,7 +183,7 @@ void dcn201_init_blank(
 
 	/* get the OPTC source */
 	tg->funcs->get_optc_source(tg, &num_opps, &opp_id_src0, &opp_id_src1);
-	ASSERT(opp_id_src0 < dc->res_pool->res_cap->num_opp);
+	ASSERT_WARN(opp_id_src0 < dc->res_pool->res_cap->num_opp);
 	opp = dc->res_pool->opps[opp_id_src0];
 
 	opp->funcs->opp_set_disp_pattern_generator(
@@ -517,7 +517,7 @@ void dcn201_update_mpcc(struct dc *dc, struct pipe_ctx *pipe_ctx)
 			dpp_id,
 			mpcc_id);
 
-	ASSERT(new_mpcc != NULL);
+	ASSERT_WARN(new_mpcc != NULL);
 	hubp->opp_id = pipe_ctx->stream_res.opp->inst;
 	hubp->mpcc_id = mpcc_id;
 }
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c
index e89ebfda4873..41cc6cfe1110 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c
@@ -421,10 +421,10 @@ static void dcn30_set_writeback(
 	struct mcif_wb *mcif_wb;
 	struct mcif_buf_params *mcif_buf_params;
 
-	ASSERT(wb_info->dwb_pipe_inst < MAX_DWB_PIPES);
-	ASSERT(wb_info->wb_enabled);
-	ASSERT(wb_info->mpcc_inst >= 0);
-	ASSERT(wb_info->mpcc_inst < dc->res_pool->mpcc_count);
+	ASSERT_WARN(wb_info->dwb_pipe_inst < MAX_DWB_PIPES);
+	ASSERT_WARN(wb_info->wb_enabled);
+	ASSERT_WARN(wb_info->mpcc_inst >= 0);
+	ASSERT_WARN(wb_info->mpcc_inst < dc->res_pool->mpcc_count);
 	mcif_wb = dc->res_pool->mcif_wb[wb_info->dwb_pipe_inst];
 	mcif_buf_params = &wb_info->mcif_buf_params;
 
@@ -544,7 +544,7 @@ void dcn30_disable_writeback(
 	struct dwbc *dwb;
 	struct mcif_wb *mcif_wb;
 
-	ASSERT(dwb_pipe_inst < MAX_DWB_PIPES);
+	ASSERT_WARN(dwb_pipe_inst < MAX_DWB_PIPES);
 	dwb = dc->res_pool->dwbc[dwb_pipe_inst];
 	mcif_wb = dc->res_pool->mcif_wb[dwb_pipe_inst];
 	DC_LOG_DWB("%s dwb_pipe_inst = %d",\
@@ -569,16 +569,16 @@ void dcn30_program_all_writeback_pipes_in_tree(
 	int i_wb, i_pipe, i_stream;
 	DC_LOG_DWB("%s", __func__);
 
-	ASSERT(stream);
+	ASSERT_WARN(stream);
 	for (i_stream = 0; i_stream < context->stream_count; i_stream++) {
 		if (context->streams[i_stream] == stream) {
 			stream_status = &context->stream_status[i_stream];
 			break;
 		}
 	}
-	ASSERT(stream_status);
+	ASSERT_WARN(stream_status);
 
-	ASSERT(stream->num_wb_info <= dc->res_pool->res_cap->num_dwb);
+	ASSERT_WARN(stream->num_wb_info <= dc->res_pool->res_cap->num_dwb);
 	/* For each writeback pipe */
 	for (i_wb = 0; i_wb < stream->num_wb_info; i_wb++) {
 
@@ -608,7 +608,7 @@ void dcn30_program_all_writeback_pipes_in_tree(
 				continue;
 			}
 
-			ASSERT(wb_info.dwb_pipe_inst < dc->res_pool->res_cap->num_dwb);
+			ASSERT_WARN(wb_info.dwb_pipe_inst < dc->res_pool->res_cap->num_dwb);
 			dwb = dc->res_pool->dwbc[wb_info.dwb_pipe_inst];
 			if (dwb->funcs->is_enabled(dwb)) {
 				/* writeback pipe already enabled, only need to update */
@@ -842,7 +842,7 @@ void dcn30_update_info_frame(struct pipe_ctx *pipe_ctx)
 	bool is_hdmi_tmds;
 	bool is_dp;
 
-	ASSERT(pipe_ctx->stream);
+	ASSERT_WARN(pipe_ctx->stream);
 
 	if (pipe_ctx->stream_res.stream_enc == NULL)
 		return;  /* this is not root pipe */
@@ -996,7 +996,7 @@ bool dcn30_apply_idle_power_optimizations(struct dc *dc, bool enable)
 						denom) - 64LL;
 
 				/* In some cases the stutter period is really big (tiny modes) in these
-				 * cases MALL cant be enabled, So skip these cases to avoid a ASSERT()
+				 * cases MALL cant be enabled, So skip these cases to avoid a ASSERT_WARN()
 				 *
 				 * We can check if stutter_period is more than 1/10th the frame time to
 				 * consider if we can actually meet the range of hysteresis timer
@@ -1010,7 +1010,7 @@ bool dcn30_apply_idle_power_optimizations(struct dc *dc, bool enable)
 
 					if (tmr_scale > 3) {
 						/* Delay exceeds range of hysteresis timer */
-						ASSERT(false);
+						ASSERT_WARN(false);
 						return false;
 					}
 
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c
index 03ba01f4ace1..d097e1fb11ad 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c
@@ -380,7 +380,7 @@ void dcn31_update_info_frame(struct pipe_ctx *pipe_ctx)
 	bool is_hdmi_tmds;
 	bool is_dp;
 
-	ASSERT(pipe_ctx->stream);
+	ASSERT_WARN(pipe_ctx->stream);
 
 	if (pipe_ctx->stream_res.stream_enc == NULL)
 		return;  /* this is not root pipe */
@@ -515,7 +515,7 @@ static void dcn31_reset_back_end_for_pipe(
 		pipe_ctx->stream = NULL;
 		return;
 	}
-	ASSERT(!pipe_ctx->top_pipe);
+	ASSERT_WARN(!pipe_ctx->top_pipe);
 
 	dc->hwss.set_abm_immediate_disable(pipe_ctx);
 
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c
index 9b88eb72086d..8ff9d7aae92f 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c
@@ -76,7 +76,7 @@ static void update_dsc_on_stream(struct pipe_ctx *pipe_ctx, bool enable)
 	struct pipe_ctx *odm_pipe;
 	int opp_cnt = 1;
 
-	ASSERT(dsc);
+	ASSERT_WARN(dsc);
 	for (odm_pipe = pipe_ctx->next_odm_pipe; odm_pipe; odm_pipe = odm_pipe->next_odm_pipe)
 		opp_cnt++;
 
@@ -92,7 +92,7 @@ static void update_dsc_on_stream(struct pipe_ctx *pipe_ctx, bool enable)
 		dsc_cfg.color_depth = stream->timing.display_color_depth;
 		dsc_cfg.is_odm = pipe_ctx->next_odm_pipe ? true : false;
 		dsc_cfg.dc_dsc_cfg = stream->timing.dsc_cfg;
-		ASSERT(dsc_cfg.dc_dsc_cfg.num_slices_h % opp_cnt == 0);
+		ASSERT_WARN(dsc_cfg.dc_dsc_cfg.num_slices_h % opp_cnt == 0);
 		dsc_cfg.dc_dsc_cfg.num_slices_h /= opp_cnt;
 
 		dsc->funcs->dsc_set_config(dsc, &dsc_cfg, &dsc_optc_cfg);
@@ -100,7 +100,7 @@ static void update_dsc_on_stream(struct pipe_ctx *pipe_ctx, bool enable)
 		for (odm_pipe = pipe_ctx->next_odm_pipe; odm_pipe; odm_pipe = odm_pipe->next_odm_pipe) {
 			struct display_stream_compressor *odm_dsc = odm_pipe->stream_res.dsc;
 
-			ASSERT(odm_dsc);
+			ASSERT_WARN(odm_dsc);
 			odm_dsc->funcs->dsc_set_config(odm_dsc, &dsc_cfg, &dsc_optc_cfg);
 			odm_dsc->funcs->dsc_enable(odm_dsc, odm_pipe->stream_res.opp->inst);
 		}
@@ -124,7 +124,7 @@ static void update_dsc_on_stream(struct pipe_ctx *pipe_ctx, bool enable)
 		/* disable DSC block */
 		dsc->funcs->dsc_disable(pipe_ctx->stream_res.dsc);
 		for (odm_pipe = pipe_ctx->next_odm_pipe; odm_pipe; odm_pipe = odm_pipe->next_odm_pipe) {
-			ASSERT(odm_pipe->stream_res.dsc);
+			ASSERT_WARN(odm_pipe->stream_res.dsc);
 			odm_pipe->stream_res.dsc->funcs->dsc_disable(odm_pipe->stream_res.dsc);
 		}
 	}
@@ -329,7 +329,7 @@ unsigned int dcn314_calculate_dccg_k1_k2_values(struct pipe_ctx *pipe_ctx, unsig
 	}
 
 	if ((*k1_div == PIXEL_RATE_DIV_NA) && (*k2_div == PIXEL_RATE_DIV_NA))
-		ASSERT(false);
+		ASSERT_WARN(false);
 
 	return odm_combine_factor;
 }
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
index fa11f075d1f9..2fa6409aa27a 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
@@ -499,7 +499,7 @@ bool dcn32_set_mcm_luts(
 		lut_params = &plane_state->in_shaper_func.pwl;
 	else if (plane_state->in_shaper_func.type == TF_TYPE_DISTRIBUTED_POINTS) {
 		// TODO: dpp_base replace
-		ASSERT(false);
+		ASSERT_WARN(false);
 		cm3_helper_translate_curve_to_hw_format(&plane_state->in_shaper_func,
 				&dpp_base->shaper_params, true);
 		lut_params = &dpp_base->shaper_params;
@@ -1025,7 +1025,7 @@ void dcn32_update_dsc_on_stream(struct pipe_ctx *pipe_ctx, bool enable)
 	bool should_use_dto_dscclk = (dccg->funcs->set_dto_dscclk != NULL) &&
 			stream->timing.pix_clk_100hz > 480000;
 
-	ASSERT(dsc);
+	ASSERT_WARN(dsc);
 	for (odm_pipe = pipe_ctx->next_odm_pipe; odm_pipe; odm_pipe = odm_pipe->next_odm_pipe)
 		opp_cnt++;
 
@@ -1056,7 +1056,7 @@ void dcn32_update_dsc_on_stream(struct pipe_ctx *pipe_ctx, bool enable)
 		dsc_cfg.color_depth = stream->timing.display_color_depth;
 		dsc_cfg.is_odm = pipe_ctx->next_odm_pipe ? true : false;
 		dsc_cfg.dc_dsc_cfg = stream->timing.dsc_cfg;
-		ASSERT(dsc_cfg.dc_dsc_cfg.num_slices_h % opp_cnt == 0);
+		ASSERT_WARN(dsc_cfg.dc_dsc_cfg.num_slices_h % opp_cnt == 0);
 		dsc_cfg.dc_dsc_cfg.num_slices_h /= opp_cnt;
 
 		if (should_use_dto_dscclk)
@@ -1066,7 +1066,7 @@ void dcn32_update_dsc_on_stream(struct pipe_ctx *pipe_ctx, bool enable)
 		for (odm_pipe = pipe_ctx->next_odm_pipe; odm_pipe; odm_pipe = odm_pipe->next_odm_pipe) {
 			struct display_stream_compressor *odm_dsc = odm_pipe->stream_res.dsc;
 
-			ASSERT(odm_dsc);
+			ASSERT_WARN(odm_dsc);
 			if (should_use_dto_dscclk)
 				dccg->funcs->set_dto_dscclk(dccg, odm_dsc->inst);
 			odm_dsc->funcs->dsc_set_config(odm_dsc, &dsc_cfg, &dsc_optc_cfg);
@@ -1088,7 +1088,7 @@ void dcn32_update_dsc_on_stream(struct pipe_ctx *pipe_ctx, bool enable)
 		/* only disconnect DSC block, DSC is disabled when OPP head pipe is reset */
 		dsc->funcs->dsc_disconnect(pipe_ctx->stream_res.dsc);
 		for (odm_pipe = pipe_ctx->next_odm_pipe; odm_pipe; odm_pipe = odm_pipe->next_odm_pipe) {
-			ASSERT(odm_pipe->stream_res.dsc);
+			ASSERT_WARN(odm_pipe->stream_res.dsc);
 			odm_pipe->stream_res.dsc->funcs->dsc_disconnect(odm_pipe->stream_res.dsc);
 		}
 	}
@@ -1204,7 +1204,7 @@ unsigned int dcn32_calculate_dccg_k1_k2_values(struct pipe_ctx *pipe_ctx, unsign
 	}
 
 	if ((*k1_div == PIXEL_RATE_DIV_NA) && (*k2_div == PIXEL_RATE_DIV_NA))
-		ASSERT(false);
+		ASSERT_WARN(false);
 
 	return odm_combine_factor;
 }
@@ -1608,7 +1608,7 @@ void dcn32_enable_phantom_streams(struct dc *dc, struct dc_state *context)
 					context,
 					dc);
 
-		ASSERT(status == DC_OK);
+		ASSERT_WARN(status == DC_OK);
 
 #ifdef CONFIG_DRM_AMD_DC_FP
 		if (hws->funcs.resync_fifo_dccg_dio)
@@ -1644,7 +1644,7 @@ void dcn32_init_blank(
 	tg->funcs->get_optc_source(tg, &num_opps, &opp_id_src0, &opp_id_src1);
 
 	if (opp_id_src0 >= dc->res_pool->res_cap->num_opp) {
-		ASSERT(false);
+		ASSERT_WARN(false);
 		return;
 	}
 
@@ -1659,7 +1659,7 @@ void dcn32_init_blank(
 		otg_active_width = otg_active_width / 2;
 
 		if (opp_id_src1 >= dc->res_pool->res_cap->num_opp) {
-			ASSERT(false);
+			ASSERT_WARN(false);
 			return;
 		}
 		for (i = 0; i < dc->res_pool->res_cap->num_opp; i++) {
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c
index e599cdc465bf..5c7e672b28e6 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c
@@ -327,7 +327,7 @@ static void update_dsc_on_stream(struct pipe_ctx *pipe_ctx, bool enable)
 
 	DC_LOGGER_INIT(stream->ctx->logger);
 
-	ASSERT(dsc);
+	ASSERT_WARN(dsc);
 	for (odm_pipe = pipe_ctx->next_odm_pipe; odm_pipe; odm_pipe = odm_pipe->next_odm_pipe)
 		opp_cnt++;
 
@@ -356,7 +356,7 @@ static void update_dsc_on_stream(struct pipe_ctx *pipe_ctx, bool enable)
 		dsc_cfg.color_depth = stream->timing.display_color_depth;
 		dsc_cfg.is_odm = pipe_ctx->next_odm_pipe ? true : false;
 		dsc_cfg.dc_dsc_cfg = stream->timing.dsc_cfg;
-		ASSERT(dsc_cfg.dc_dsc_cfg.num_slices_h % opp_cnt == 0);
+		ASSERT_WARN(dsc_cfg.dc_dsc_cfg.num_slices_h % opp_cnt == 0);
 		dsc_cfg.dc_dsc_cfg.num_slices_h /= opp_cnt;
 
 		dsc->funcs->dsc_set_config(dsc, &dsc_cfg, &dsc_optc_cfg);
@@ -364,7 +364,7 @@ static void update_dsc_on_stream(struct pipe_ctx *pipe_ctx, bool enable)
 		for (odm_pipe = pipe_ctx->next_odm_pipe; odm_pipe; odm_pipe = odm_pipe->next_odm_pipe) {
 			struct display_stream_compressor *odm_dsc = odm_pipe->stream_res.dsc;
 
-			ASSERT(odm_dsc);
+			ASSERT_WARN(odm_dsc);
 			odm_dsc->funcs->dsc_set_config(odm_dsc, &dsc_cfg, &dsc_optc_cfg);
 			odm_dsc->funcs->dsc_enable(odm_dsc, odm_pipe->stream_res.opp->inst);
 		}
@@ -388,7 +388,7 @@ static void update_dsc_on_stream(struct pipe_ctx *pipe_ctx, bool enable)
 		/* disable DSC block */
 		dsc->funcs->dsc_disable(pipe_ctx->stream_res.dsc);
 		for (odm_pipe = pipe_ctx->next_odm_pipe; odm_pipe; odm_pipe = odm_pipe->next_odm_pipe) {
-			ASSERT(odm_pipe->stream_res.dsc);
+			ASSERT_WARN(odm_pipe->stream_res.dsc);
 			odm_pipe->stream_res.dsc->funcs->dsc_disable(odm_pipe->stream_res.dsc);
 		}
 	}
@@ -1552,7 +1552,7 @@ static bool should_avoid_empty_tu(struct pipe_ctx *pipe_ctx)
 		break;
 	default:
 		// We shouldn't be tunneling any other rates, something is wrong
-		ASSERT(0);
+		ASSERT_WARN(0);
 		return false;
 	}
 
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
index 307782592789..a589654fc650 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
@@ -86,7 +86,7 @@ void dcn401_program_gamut_remap(struct pipe_ctx *pipe_ctx)
 
 	//For now assert if location is not pre-blend
 	if (pipe_ctx->plane_state)
-		ASSERT(pipe_ctx->plane_state->mcm_location == MPCC_MOVABLE_CM_LOCATION_BEFORE);
+		ASSERT_WARN(pipe_ctx->plane_state->mcm_location == MPCC_MOVABLE_CM_LOCATION_BEFORE);
 
 	// program MPCC_MCM_FIRST_GAMUT_REMAP
 	memset(&mpc_adjust, 0, sizeof(mpc_adjust));
@@ -530,7 +530,7 @@ void dcn401_populate_mcm_luts(struct dc *dc,
 		if (mcm_luts.shaper->type == TF_TYPE_HWPWL)
 			m_lut_params.pwl = &mcm_luts.shaper->pwl;
 		else if (mcm_luts.shaper->type == TF_TYPE_DISTRIBUTED_POINTS) {
-			ASSERT(false);
+			ASSERT_WARN(false);
 			rval = cm3_helper_translate_curve_to_hw_format(
 					mcm_luts.shaper,
 					&dpp_base->regamma_params, true);
@@ -764,7 +764,7 @@ void dcn401_calculate_dccg_tmds_div_value(struct pipe_ctx *pipe_ctx,
 	}
 
 	if (*tmds_div == PIXEL_RATE_DIV_NA)
-		ASSERT(false);
+		ASSERT_WARN(false);
 
 }
 
diff --git a/drivers/gpu/drm/amd/display/dc/irq/irq_service.c b/drivers/gpu/drm/amd/display/dc/irq/irq_service.c
index eca3d7ee7e4e..5e05dde39c6e 100644
--- a/drivers/gpu/drm/amd/display/dc/irq/irq_service.c
+++ b/drivers/gpu/drm/amd/display/dc/irq/irq_service.c
@@ -116,7 +116,7 @@ bool dal_irq_service_set(
 		if (info->funcs->set == dal_irq_service_dummy_set) {
 			DC_LOG_WARNING("%s: src: %d, st: %d\n", __func__,
 				       source, enable);
-			ASSERT(0);
+			ASSERT_WARN(0);
 		}
 
 		return info->funcs->set(irq_service, info, enable);
@@ -156,7 +156,7 @@ bool dal_irq_service_ack(
 	if (info->funcs && info->funcs->ack) {
 		if (info->funcs->ack == dal_irq_service_dummy_ack) {
 			DC_LOG_WARNING("%s: src: %d\n", __func__, source);
-			ASSERT(0);
+			ASSERT_WARN(0);
 		}
 
 		return info->funcs->ack(irq_service, info);
diff --git a/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_cts.c b/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_cts.c
index ff8fe1a94965..52549106c740 100644
--- a/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_cts.c
+++ b/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_cts.c
@@ -114,7 +114,7 @@ static void dp_test_send_link_training(struct dc_link *link)
 
 	if (link_settings.link_rate == LINK_RATE_UNKNOWN) {
 		DC_LOG_ERROR("%s: Invalid test link rate.", __func__);
-		ASSERT(0);
+		ASSERT_WARN(0);
 	}
 
 	/* Set preferred link settings */
@@ -456,7 +456,7 @@ static void set_crtc_test_pattern(struct dc_link *link,
 
 			if (controller_color_space == CONTROLLER_DP_COLOR_SPACE_UDEFINED) {
 				DC_LOG_ERROR("%s: Color space must be defined for test pattern", __func__);
-				ASSERT(0);
+				ASSERT_WARN(0);
 			}
 
 			odm_pipe = pipe_ctx;
diff --git a/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dio.c b/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dio.c
index 3e47a6735912..4f60b6a77233 100644
--- a/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dio.c
+++ b/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dio.c
@@ -195,7 +195,7 @@ void update_dio_stream_allocation_table(struct dc_link *link,
 {
 	struct link_encoder *link_enc = link_enc_cfg_get_link_enc(link);
 
-	ASSERT(link_enc);
+	ASSERT_WARN(link_enc);
 	link_enc->funcs->update_mst_stream_allocation_table(link_enc, table);
 }
 
diff --git a/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dpia.c b/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dpia.c
index 6499807af72a..2ce10f880227 100644
--- a/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dpia.c
+++ b/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dpia.c
@@ -46,7 +46,7 @@ static void update_dpia_stream_allocation_table(struct dc_link *link,
 
 	status = dc_process_dmub_set_mst_slots(link->dc, link->link_index,
 			mst_alloc_slots, &prev_mst_slots_in_use);
-	ASSERT(status == DC_OK);
+	ASSERT_WARN(status == DC_OK);
 	DC_LOG_MST("dpia : status[%d]: alloc_slots[%d]: used_slots[%d]\n",
 			status, mst_alloc_slots, prev_mst_slots_in_use);
 
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_detection.c b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
index e026c728042a..6b2af0631209 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_detection.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
@@ -567,7 +567,7 @@ static void read_current_link_settings_on_detect(struct dc_link *link)
 			}
 		} else {
 			// Link Rate not found. Seamless boot may not work.
-			ASSERT(false);
+			ASSERT_WARN(false);
 		}
 	} else {
 		link->cur_link_settings.link_rate = link_bw_set;
@@ -790,7 +790,7 @@ static void verify_link_capability_destructive(struct dc_link *link,
 				link, &known_limit_link_setting,
 				LINK_TRAINING_MAX_VERIFY_RETRY);
 	} else {
-		ASSERT(0);
+		ASSERT_WARN(0);
 	}
 
 	if (should_prepare_phy_clocks)
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_dpms.c b/drivers/gpu/drm/amd/display/dc/link/link_dpms.c
index 5d66bfc7fe6e..5da83c39f5e1 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_dpms.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_dpms.c
@@ -661,7 +661,7 @@ static void update_psp_stream_config(struct pipe_ctx *pipe_ctx, bool dpms_off)
 		return;
 
 	link_enc = link_enc_cfg_get_link_enc(pipe_ctx->stream->link);
-	ASSERT(link_enc);
+	ASSERT_WARN(link_enc);
 	if (link_enc == NULL)
 		return;
 
@@ -815,7 +815,7 @@ void link_set_dsc_on_stream(struct pipe_ctx *pipe_ctx, bool enable)
 		dsc_cfg.color_depth = stream->timing.display_color_depth;
 		dsc_cfg.is_odm = pipe_ctx->next_odm_pipe ? true : false;
 		dsc_cfg.dc_dsc_cfg = stream->timing.dsc_cfg;
-		ASSERT(dsc_cfg.dc_dsc_cfg.num_slices_h % opp_cnt == 0);
+		ASSERT_WARN(dsc_cfg.dc_dsc_cfg.num_slices_h % opp_cnt == 0);
 		dsc_cfg.dc_dsc_cfg.num_slices_h /= opp_cnt;
 
 		if (should_use_dto_dscclk)
@@ -1236,7 +1236,7 @@ static void update_mst_stream_alloc_table(
 	int j;
 
 	/* if DRM proposed_table has more than one new payload */
-	ASSERT(proposed_table->stream_count -
+	ASSERT_WARN(proposed_table->stream_count -
 			link->mst_stream_alloc_table.stream_count < 2);
 
 	/* copy proposed_table to link, add stream encoder */
@@ -1457,7 +1457,7 @@ static enum dc_status allocate_mst_payload(struct pipe_ctx *pipe_ctx)
 		link->mst_stream_alloc_table.stream_allocations[i].slot_count);
 	}
 
-	ASSERT(proposed_table.stream_count > 0);
+	ASSERT_WARN(proposed_table.stream_count > 0);
 
 	/* program DP source TX for payload */
 	if (link_hwss->ext.update_stream_allocation_table == NULL ||
@@ -1542,7 +1542,7 @@ static bool write_128b_132b_sst_payload_allocation_table(
 		avg_time_slots_per_mtp = link_calculate_sst_avg_time_slots_per_mtp(stream, link);
 		req_slot_count = dc_fixpt_ceil(avg_time_slots_per_mtp);
 		/// Validation should filter out modes that exceed link BW
-		ASSERT(req_slot_count <= MAX_MTP_SLOT_COUNT);
+		ASSERT_WARN(req_slot_count <= MAX_MTP_SLOT_COUNT);
 		if (req_slot_count > MAX_MTP_SLOT_COUNT)
 			return false;
 	} else {
@@ -1565,14 +1565,14 @@ static bool write_128b_132b_sst_payload_allocation_table(
 			1);
 
 	/// Program the changes in DPCD 1C0 - 1C2
-	ASSERT(vc_id == 1);
+	ASSERT_WARN(vc_id == 1);
 	core_link_write_dpcd(
 			link,
 			DP_PAYLOAD_ALLOCATE_SET,
 			&vc_id,
 			1);
 
-	ASSERT(start_time_slot == 0);
+	ASSERT_WARN(start_time_slot == 0);
 	core_link_write_dpcd(
 			link,
 			DP_PAYLOAD_ALLOCATE_START_TIME_SLOT,
@@ -1670,7 +1670,7 @@ static enum dc_status update_sst_payload(struct pipe_ctx *pipe_ctx,
 
 	proposed_table.stream_allocations[0].hpo_dp_stream_enc = pipe_ctx->stream_res.hpo_dp_stream_enc;
 
-	ASSERT(proposed_table.stream_count == 1);
+	ASSERT_WARN(proposed_table.stream_count == 1);
 
 	//TODO - DP2.0 Logging: Instead of hpo_dp_stream_enc pointer, log instance id
 	DC_LOG_DP2("SST Update Payload: hpo_dp_stream_enc: %p      "
@@ -1780,7 +1780,7 @@ enum dc_status link_reduce_mst_payload(struct pipe_ctx *pipe_ctx, uint32_t bw_in
 		link->mst_stream_alloc_table.stream_allocations[i].slot_count);
 	}
 
-	ASSERT(proposed_table.stream_count > 0);
+	ASSERT_WARN(proposed_table.stream_count > 0);
 
 	/* update mst stream allocation table hardware state */
 	if (link_hwss->ext.update_stream_allocation_table == NULL ||
@@ -1847,7 +1847,7 @@ enum dc_status link_increase_mst_payload(struct pipe_ctx *pipe_ctx, uint32_t bw_
 		link->mst_stream_alloc_table.stream_allocations[i].slot_count);
 	}
 
-	ASSERT(proposed_table.stream_count > 0);
+	ASSERT_WARN(proposed_table.stream_count > 0);
 
 	/* update mst stream allocation table hardware state */
 	if (link_hwss->ext.update_stream_allocation_table == NULL ||
@@ -2335,7 +2335,7 @@ void link_set_dpms_off(struct pipe_ctx *pipe_ctx)
 
 	DC_LOGGER_INIT(pipe_ctx->stream->ctx->logger);
 
-	ASSERT(is_master_pipe_for_link(link, pipe_ctx));
+	ASSERT_WARN(is_master_pipe_for_link(link, pipe_ctx));
 
 	if (dp_is_128b_132b_signal(pipe_ctx))
 		vpg = pipe_ctx->stream_res.hpo_dp_stream_enc->vpg;
@@ -2451,7 +2451,7 @@ void link_set_dpms_on(
 
 	DC_LOGGER_INIT(pipe_ctx->stream->ctx->logger);
 
-	ASSERT(is_master_pipe_for_link(link, pipe_ctx));
+	ASSERT_WARN(is_master_pipe_for_link(link, pipe_ctx));
 
 	if (dp_is_128b_132b_signal(pipe_ctx))
 		vpg = pipe_ctx->stream_res.hpo_dp_stream_enc->vpg;
@@ -2468,7 +2468,7 @@ void link_set_dpms_on(
 	}
 
 	link_enc = link_enc_cfg_get_link_enc(link);
-	ASSERT(link_enc);
+	ASSERT_WARN(link_enc);
 
 	if (!dc_is_virtual_signal(pipe_ctx->stream->signal)
 			&& !dp_is_128b_132b_signal(pipe_ctx)) {
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
index 9dabaf682171..672b973fe631 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
@@ -281,7 +281,7 @@ static enum clock_source_id get_clock_source_id(struct dc_link *link)
 		 * dp clock source is not initialized for some reason.
 		 * Should not happen, CLOCK_SOURCE_ID_EXTERNAL will be used
 		 */
-		ASSERT(dp_cs);
+		ASSERT_WARN(dp_cs);
 	}
 
 	return dp_cs_id;
@@ -333,7 +333,7 @@ bool dp_is_fec_supported(const struct dc_link *link)
 	struct link_encoder *link_enc = NULL;
 
 	link_enc = link_enc_cfg_get_link_enc(link);
-	ASSERT(link_enc);
+	ASSERT_WARN(link_enc);
 
 	return (dc_is_dp_signal(link->connector_signal) && link_enc &&
 			link_enc->features.fec_supported &&
@@ -363,7 +363,7 @@ bool dp_should_enable_fec(const struct dc_link *link)
 bool dp_is_128b_132b_signal(struct pipe_ctx *pipe_ctx)
 {
 	/* If this assert is hit then we have a link encoder dynamic management issue */
-	ASSERT(pipe_ctx->stream_res.hpo_dp_stream_enc ? pipe_ctx->link_res.hpo_dp_link_enc != NULL : true);
+	ASSERT_WARN(pipe_ctx->stream_res.hpo_dp_stream_enc ? pipe_ctx->link_res.hpo_dp_link_enc != NULL : true);
 	return (pipe_ctx->stream_res.hpo_dp_stream_enc &&
 			pipe_ctx->link_res.hpo_dp_link_enc &&
 			dc_is_dp_signal(pipe_ctx->stream->signal));
@@ -2093,7 +2093,7 @@ bool dp_get_max_link_enc_cap(const struct dc_link *link, struct dc_link_settings
 	}
 
 	link_enc = link_enc_cfg_get_link_enc(link);
-	ASSERT(link_enc);
+	ASSERT_WARN(link_enc);
 
 	if (link_enc && link_enc->funcs->get_max_link_cap) {
 		link_enc->funcs->get_max_link_cap(link_enc, max_link_enc_cap);
@@ -2124,7 +2124,7 @@ struct dc_link_settings dp_get_max_link_cap(struct dc_link *link)
 	bool is_uhbr13_5_supported = true;
 
 	link_enc = link_enc_cfg_get_link_enc(link);
-	ASSERT(link_enc);
+	ASSERT_WARN(link_enc);
 
 	/* get max link encoder capability */
 	if (link_enc)
@@ -2365,7 +2365,7 @@ bool dp_is_sink_present(struct dc_link *link)
 	 */
 	do {
 		gpio_result = dal_gpio_get_value(ddc->pin_clock, &clock_pin);
-		ASSERT(gpio_result == GPIO_RESULT_OK);
+		ASSERT_WARN(gpio_result == GPIO_RESULT_OK);
 		if (clock_pin)
 			fsleep(1000);
 		else
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_phy.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_phy.c
index bafa52a0165a..59d0a0e7de3b 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_phy.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_phy.c
@@ -146,7 +146,7 @@ enum dc_status dp_set_fec_ready(struct dc_link *link, const struct link_resource
 	uint8_t fec_config = 0;
 
 	link_enc = link_enc_cfg_get_link_enc(link);
-	ASSERT(link_enc);
+	ASSERT_WARN(link_enc);
 	if (link_enc->funcs->fec_set_ready == NULL)
 		return DC_NOT_SUPPORTED;
 
@@ -179,7 +179,7 @@ void dp_set_fec_enable(struct dc_link *link, bool enable)
 	struct link_encoder *link_enc = NULL;
 
 	link_enc = link_enc_cfg_get_link_enc(link);
-	ASSERT(link_enc);
+	ASSERT_WARN(link_enc);
 	if (link_enc->funcs->fec_set_enable == NULL)
 		return;
 
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.c
index 754c895e1bfb..eecc9785c743 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.c
@@ -194,7 +194,7 @@ uint8_t dp_initialize_scrambling_data_symbols(
 		disable_scrabled_data_symbols = 0;
 		break;
 	default:
-		ASSERT(0);
+		ASSERT_WARN(0);
 		DC_LOG_HW_LINK_TRAINING("%s: Invalid HW Training pattern: %d\n",
 			__func__, pattern);
 		break;
@@ -245,7 +245,7 @@ enum dpcd_training_patterns
 		dpcd_tr_pattern = DPCD_TRAINING_PATTERN_VIDEOIDLE;
 		break;
 	default:
-		ASSERT(0);
+		ASSERT_WARN(0);
 		DC_LOG_HW_LINK_TRAINING("%s: Invalid HW Training pattern: %d\n",
 			__func__, pattern);
 		break;
@@ -807,7 +807,7 @@ enum dc_dp_training_pattern decide_eq_training_pattern(struct dc_link *link,
 	enum dc_dp_training_pattern pattern = DP_TRAINING_PATTERN_SEQUENCE_2;
 
 	link_enc = link_enc_cfg_get_link_enc(link);
-	ASSERT(link_enc);
+	ASSERT_WARN(link_enc);
 	enc_caps = &link_enc->features;
 
 	switch (link_dp_get_encoding_format(link_settings)) {
@@ -841,7 +841,7 @@ enum lttpr_mode dp_decide_lttpr_mode(struct dc_link *link,
 	else if (encoding == DP_128b_132b_ENCODING)
 		return dp_decide_128b_132b_lttpr_mode(link);
 
-	ASSERT(0);
+	ASSERT_WARN(0);
 	return LTTPR_MODE_NON_LTTPR;
 }
 
@@ -1482,14 +1482,14 @@ static bool perform_post_lt_adj_req_sequence(
 			DC_LOG_WARNING("%s: Post Link Training Adjust Request Timed out\n",
 				__func__);
 
-			ASSERT(0);
+			ASSERT_WARN(0);
 			return true;
 		}
 	}
 	DC_LOG_WARNING("%s: Post Link Training Adjust Request limit reached\n",
 		__func__);
 
-	ASSERT(0);
+	ASSERT_WARN(0);
 	return true;
 
 }
@@ -1581,7 +1581,7 @@ enum link_training_result dp_perform_link_training(
 	else if (encoding == DP_128b_132b_ENCODING)
 		status = dp_perform_128b_132b_link_training(link, link_res, &lt_settings);
 	else
-		ASSERT(0);
+		ASSERT_WARN(0);
 
 	/* exit training mode */
 	if ((dpcd_exit_training_mode(link, encoding) != LINK_TRAINING_SUCCESS || status == LINK_TRAINING_ABORT) &&
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training_8b_10b.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training_8b_10b.c
index 3bdce32a85e3..1588e1bb1dab 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training_8b_10b.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training_8b_10b.c
@@ -261,7 +261,7 @@ enum link_training_result perform_8b_10b_clock_recovery_sequence(
 	}
 
 	if (retry_count >= LINK_TRAINING_MAX_CR_RETRY) {
-		ASSERT(0);
+		ASSERT_WARN(0);
 		DC_LOG_ERROR("%s: Link Training Error, could not get CR after %d tries. Possibly voltage swing issue",
 			__func__,
 			LINK_TRAINING_MAX_CR_RETRY);
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training_dpia.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training_dpia.c
index 39e4b7dc9588..e6bb88bf9d23 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training_dpia.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training_dpia.c
@@ -188,7 +188,7 @@ static uint8_t dpia_build_set_config_data(
 				lt_settings->hw_lane_settings[0].PRE_EMPHASIS == PRE_EMPHASIS_MAX_LEVEL ? 1 : 0;
 		break;
 	default:
-		ASSERT(false); /* Message type not supported by helper function. */
+		ASSERT_WARN(false); /* Message type not supported by helper function. */
 		break;
 	}
 
@@ -217,7 +217,7 @@ static enum dc_status convert_trng_ptn_to_trng_stg(enum dc_dp_training_pattern t
 		*ts = DPIA_TS_DPRX_DONE;
 		break;
 	default: /* TPS not supported by helper function. */
-		ASSERT(false);
+		ASSERT_WARN(false);
 		*ts = DPIA_TS_DPRX_DONE;
 		status = DC_UNSUPPORTED_VALUE;
 		break;
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training_fixed_vs_pe_retimer.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training_fixed_vs_pe_retimer.c
index ccf8096dde29..fd9784e9d55b 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training_fixed_vs_pe_retimer.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training_fixed_vs_pe_retimer.c
@@ -216,7 +216,7 @@ enum link_training_result dp_perform_fixed_vs_pe_training_sequence(
 	uint8_t rate;
 
 	/* Only 8b/10b is supported */
-	ASSERT(link_dp_get_encoding_format(&lt_settings->link_settings) ==
+	ASSERT_WARN(link_dp_get_encoding_format(&lt_settings->link_settings) ==
 			DP_8b_10b_ENCODING);
 
 	if (lt_settings->lttpr_mode == LTTPR_MODE_NON_TRANSPARENT) {
@@ -436,7 +436,7 @@ enum link_training_result dp_perform_fixed_vs_pe_training_sequence(
 		}
 
 		if (retry_count >= LINK_TRAINING_MAX_CR_RETRY) {
-			ASSERT(0);
+			ASSERT_WARN(0);
 			DC_LOG_ERROR("%s: Link Training Error, could not get CR after %d tries. Possibly voltage swing issue",
 				__func__,
 				LINK_TRAINING_MAX_CR_RETRY);
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dpcd.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dpcd.c
index 584b9295a12a..c716cf335275 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dpcd.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dpcd.c
@@ -165,7 +165,7 @@ static void dpcd_extend_address_range(
 		*out_address = new_addr_range.start;
 		*out_size = ADDRESS_RANGE_SIZE(new_addr_range.start, new_addr_range.end);
 		*out_data = kcalloc(*out_size, sizeof(**out_data), GFP_KERNEL);
-		ASSERT(*out_data);
+		ASSERT_WARN(*out_data);
 	}
 }
 
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_edp_panel_control.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_edp_panel_control.c
index e0e3bb865359..efab95fc25d8 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_edp_panel_control.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_edp_panel_control.c
@@ -87,7 +87,7 @@ void dp_set_panel_mode(struct dc_link *link, enum dp_panel_mode panel_mode)
 			&edp_config_set.raw,
 			sizeof(edp_config_set.raw));
 
-		ASSERT(result == DC_OK);
+		ASSERT_WARN(result == DC_OK);
 	}
 
 	link->panel_mode = panel_mode;
@@ -327,7 +327,7 @@ bool edp_is_ilr_optimization_required(struct dc_link *link,
 	uint32_t req_bw;
 	union lane_count_set lane_count_set = {0};
 
-	ASSERT(link || crtc_timing); // invalid input
+	ASSERT_WARN(link || crtc_timing); // invalid input
 
 	if (!edp_is_ilr_optimization_enabled(link))
 		return false;
@@ -846,7 +846,7 @@ bool edp_setup_psr(struct dc_link *link,
 	 * should not happen since firmware should be running at this point
 	 */
 	if (link->psr_settings.psr_feature_enabled == 0)
-		ASSERT(0);
+		ASSERT_WARN(0);
 
 	return true;
 
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_hpd.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_hpd.c
index caa617883f62..377bd01a8d69 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_hpd.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_hpd.c
@@ -108,7 +108,7 @@ struct gpio *link_get_hpd_gpio(struct dc_bios *dcb,
 		hpd_info.hpd_int_gpio_uid, &pin_info);
 
 	if (bp_result != BP_RESULT_OK) {
-		ASSERT(bp_result == BP_RESULT_NORECORD);
+		ASSERT_WARN(bp_result == BP_RESULT_NORECORD);
 		return NULL;
 	}
 
diff --git a/drivers/gpu/drm/amd/display/dc/mpc/dcn10/dcn10_mpc.c b/drivers/gpu/drm/amd/display/dc/mpc/dcn10/dcn10_mpc.c
index f2f55565e98a..ca1ee17bb06b 100644
--- a/drivers/gpu/drm/amd/display/dc/mpc/dcn10/dcn10_mpc.c
+++ b/drivers/gpu/drm/amd/display/dc/mpc/dcn10/dcn10_mpc.c
@@ -50,7 +50,7 @@ void mpc1_set_bg_color(struct mpc *mpc,
 	/* find bottommost mpcc. */
 	while (bottommost_mpcc->mpcc_bot) {
 		/* avoid circular linked link */
-		ASSERT(bottommost_mpcc != bottommost_mpcc->mpcc_bot);
+		ASSERT_WARN(bottommost_mpcc != bottommost_mpcc->mpcc_bot);
 		if (bottommost_mpcc == bottommost_mpcc->mpcc_bot)
 			break;
 
@@ -110,7 +110,7 @@ void mpc1_assert_idle_mpcc(struct mpc *mpc, int id)
 {
 	struct dcn10_mpc *mpc10 = TO_DCN10_MPC(mpc);
 
-	ASSERT(!(mpc10->mpcc_in_use_mask & 1 << id));
+	ASSERT_WARN(!(mpc10->mpcc_in_use_mask & 1 << id));
 	REG_WAIT(MPCC_STATUS[id],
 			MPCC_IDLE, 1,
 			1, 100000);
@@ -120,7 +120,7 @@ struct mpcc *mpc1_get_mpcc(struct mpc *mpc, int mpcc_id)
 {
 	struct dcn10_mpc *mpc10 = TO_DCN10_MPC(mpc);
 
-	ASSERT(mpcc_id < mpc10->num_mpcc);
+	ASSERT_WARN(mpcc_id < mpc10->num_mpcc);
 	return &(mpc->mpcc_array[mpcc_id]);
 }
 
@@ -133,7 +133,7 @@ struct mpcc *mpc1_get_mpcc_for_dpp(struct mpc_tree *tree, int dpp_id)
 			return tmp_mpcc;
 
 		/* avoid circular linked list */
-		ASSERT(tmp_mpcc != tmp_mpcc->mpcc_bot);
+		ASSERT_WARN(tmp_mpcc != tmp_mpcc->mpcc_bot);
 		if (tmp_mpcc == tmp_mpcc->mpcc_bot)
 			break;
 
@@ -171,8 +171,8 @@ void mpc1_assert_mpcc_idle_before_connect(struct mpc *mpc, int mpcc_id)
 				MPCC_BUSY, &mpc_busy,
 				MPCC_IDLE, &mpc_idle);
 
-		ASSERT(mpc_busy == 0);
-		ASSERT(mpc_idle == 1);
+		ASSERT_WARN(mpc_busy == 0);
+		ASSERT_WARN(mpc_idle == 1);
 	}
 }
 
@@ -205,8 +205,8 @@ struct mpcc *mpc1_insert_plane(
 	struct mpcc *new_mpcc = NULL;
 
 	/* sanity check parameters */
-	ASSERT(mpcc_id < mpc10->num_mpcc);
-	ASSERT(!(mpc10->mpcc_in_use_mask & 1 << mpcc_id));
+	ASSERT_WARN(mpcc_id < mpc10->num_mpcc);
+	ASSERT_WARN(!(mpc10->mpcc_in_use_mask & 1 << mpcc_id));
 
 	if (insert_above_mpcc) {
 		/* check insert_above_mpcc exist in tree->opp_list */
diff --git a/drivers/gpu/drm/amd/display/dc/mpc/dcn20/dcn20_mpc.c b/drivers/gpu/drm/amd/display/dc/mpc/dcn20/dcn20_mpc.c
index ea73473b970a..324b8100095c 100644
--- a/drivers/gpu/drm/amd/display/dc/mpc/dcn20/dcn20_mpc.c
+++ b/drivers/gpu/drm/amd/display/dc/mpc/dcn20/dcn20_mpc.c
@@ -473,7 +473,7 @@ void mpc2_assert_idle_mpcc(struct mpc *mpc, int id)
 	struct dcn20_mpc *mpc20 = TO_DCN20_MPC(mpc);
 	unsigned int mpc_disabled;
 
-	ASSERT(!(mpc20->mpcc_in_use_mask & 1 << id));
+	ASSERT_WARN(!(mpc20->mpcc_in_use_mask & 1 << id));
 	REG_GET(MPCC_STATUS[id], MPCC_DISABLED, &mpc_disabled);
 	if (mpc_disabled)
 		return;
@@ -497,12 +497,12 @@ void mpc2_assert_mpcc_idle_before_connect(struct mpc *mpc, int mpcc_id)
 			MPCC_DISABLED, &mpc_disabled);
 
 	if (top_sel == 0xf) {
-		ASSERT(!mpc_busy);
-		ASSERT(mpc_idle);
-		ASSERT(mpc_disabled);
+		ASSERT_WARN(!mpc_busy);
+		ASSERT_WARN(mpc_idle);
+		ASSERT_WARN(mpc_disabled);
 	} else {
-		ASSERT(!mpc_disabled);
-		ASSERT(!mpc_idle);
+		ASSERT_WARN(!mpc_disabled);
+		ASSERT_WARN(!mpc_idle);
 	}
 }
 
@@ -531,7 +531,7 @@ static struct mpcc *mpc2_get_mpcc_for_dpp(struct mpc_tree *tree, int dpp_id)
 			return tmp_mpcc;
 
 		/* avoid circular linked list */
-		ASSERT(tmp_mpcc != tmp_mpcc->mpcc_bot);
+		ASSERT_WARN(tmp_mpcc != tmp_mpcc->mpcc_bot);
 		if (tmp_mpcc == tmp_mpcc->mpcc_bot)
 			break;
 
diff --git a/drivers/gpu/drm/amd/display/dc/opp/dcn20/dcn20_opp.c b/drivers/gpu/drm/amd/display/dc/opp/dcn20/dcn20_opp.c
index f5fe0cac7cb0..84581acdaf0a 100644
--- a/drivers/gpu/drm/amd/display/dc/opp/dcn20/dcn20_opp.c
+++ b/drivers/gpu/drm/amd/display/dc/opp/dcn20/dcn20_opp.c
@@ -309,7 +309,7 @@ void opp2_dpg_set_blank_color(
 	struct dcn20_opp *oppn20 = TO_DCN20_OPP(opp);
 
 	/* 16-bit MSB aligned value. Bits 3:0 of this field are hardwired to ZERO */
-	ASSERT(color);
+	ASSERT_WARN(color);
 	REG_SET_2(DPG_COLOUR_B_CB, 0,
 			DPG_COLOUR1_B_CB, color->color_b_cb << 6,
 			DPG_COLOUR0_B_CB, color->color_b_cb << 6);
diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c b/drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c
index 097d06023e64..9350e59828b6 100644
--- a/drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c
@@ -597,7 +597,7 @@ bool optc1_validate_timing(
 	uint32_t min_v_blank;
 	struct optc *optc1 = DCN10TG_FROM_TG(optc);
 
-	ASSERT(timing != NULL);
+	ASSERT_WARN(timing != NULL);
 
 	v_blank = (timing->v_total - timing->v_addressable -
 					timing->v_border_top - timing->v_border_bottom);
diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.c b/drivers/gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.c
index b4694985a40a..382392b199a5 100644
--- a/drivers/gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.c
@@ -184,7 +184,7 @@ void optc2_set_odm_combine(struct timing_generator *optc, int *opp_id, int opp_c
 	struct optc *optc1 = DCN10TG_FROM_TG(optc);
 	uint32_t memory_mask;
 
-	ASSERT(opp_cnt == 2);
+	ASSERT_WARN(opp_cnt == 2);
 
 	/* TODO: In pseudocode but does not affect maximus, delete comment if we dont need on asic
 	 * REG_SET(OTG_GLOBAL_CONTROL2, 0, GLOBAL_UPDATE_LOCK_EN, 1);
diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn201/dcn201_optc.c b/drivers/gpu/drm/amd/display/dc/optc/dcn201/dcn201_optc.c
index 49c2efdfa403..098ec25d5bf6 100644
--- a/drivers/gpu/drm/amd/display/dc/optc/dcn201/dcn201_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/optc/dcn201/dcn201_optc.c
@@ -74,7 +74,7 @@ static bool optc201_validate_timing(
 	uint32_t min_v_blank;
 	struct optc *optc1 = DCN10TG_FROM_TG(optc);
 
-	ASSERT(timing != NULL);
+	ASSERT_WARN(timing != NULL);
 
 	v_blank = (timing->v_total - timing->v_addressable -
 					timing->v_border_top - timing->v_border_bottom);
diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn30/dcn30_optc.c b/drivers/gpu/drm/amd/display/dc/optc/dcn30/dcn30_optc.c
index 4c95c0958612..fcd854568ebd 100644
--- a/drivers/gpu/drm/amd/display/dc/optc/dcn30/dcn30_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/optc/dcn30/dcn30_optc.c
@@ -229,7 +229,7 @@ void optc3_set_odm_combine(struct timing_generator *optc, int *opp_id, int opp_c
 	 *		MASTER_UPDATE_LOCK_DB_Y, 240);
 	 */
 
-	ASSERT(opp_cnt == 2 || opp_cnt == 4);
+	ASSERT_WARN(opp_cnt == 2 || opp_cnt == 4);
 
 	/* 2 pieces of memory required for up to 5120 displays, 4 for up to 8192,
 	 * however, for ODM combine we can simplify by always using 4.
diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn31/dcn31_optc.c b/drivers/gpu/drm/amd/display/dc/optc/dcn31/dcn31_optc.c
index 4b6446ed4ce4..0748c464e4bb 100644
--- a/drivers/gpu/drm/amd/display/dc/optc/dcn31/dcn31_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/optc/dcn31/dcn31_optc.c
@@ -52,7 +52,7 @@ static void optc31_set_odm_combine(struct timing_generator *optc, int *opp_id, i
 		if (mem_count_per_opp == 1)
 			memory_mask = 0xf;
 		else {
-			ASSERT(mem_count_per_opp == 2);
+			ASSERT_WARN(mem_count_per_opp == 2);
 			memory_mask = 0xff;
 		}
 	} else if (mem_count_per_opp == 1)
diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c b/drivers/gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c
index dfa9364fe5a6..0eff16bac235 100644
--- a/drivers/gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c
@@ -333,7 +333,7 @@ static void optc35_set_long_vtotal(
 			// If MAX_OTG_V_COUNT < DRR trigger < v_total_min < v_total_max,
 			// DRR trigger will drop the vtotal counting directly to a new frame.
 			// But it should trigger between v_total_min and v_total_max.
-			ASSERT(0);
+			ASSERT_WARN(0);
 
 			REG_UPDATE_4(OTG_V_TOTAL_CONTROL,
 				OTG_SET_V_TOTAL_MIN_MASK, 0,
diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn401/dcn401_optc.c b/drivers/gpu/drm/amd/display/dc/optc/dcn401/dcn401_optc.c
index 783ca9acc762..b31dce9c5a8c 100644
--- a/drivers/gpu/drm/amd/display/dc/optc/dcn401/dcn401_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/optc/dcn401/dcn401_optc.c
@@ -89,7 +89,7 @@ static uint32_t decide_odm_mem_bit_map(int *opp_id, int opp_cnt, int h_active)
 			}
 		}
 	}
-	ASSERT(total_required == total_allocated);
+	ASSERT_WARN(total_required == total_allocated);
 
 	for (i = 0; i < MAX_PIPES; i++) {
 		if (first_preferred_memory_for_opp[i])
@@ -156,7 +156,7 @@ static void optc401_set_odm_combine(struct timing_generator *optc, int *opp_id,
 				OTG_H_TIMING_DIV_MODE, H_TIMING_DIV_BY4);
 		break;
 	default:
-		ASSERT(false);
+		ASSERT_WARN(false);
 	}
 ;
 	optc1->opp_count = opp_cnt;
diff --git a/drivers/gpu/drm/amd/display/dc/os_types.h b/drivers/gpu/drm/amd/display/dc/os_types.h
index f2ba76c1e0c0..42f3712aef9e 100644
--- a/drivers/gpu/drm/amd/display/dc/os_types.h
+++ b/drivers/gpu/drm/amd/display/dc/os_types.h
@@ -74,7 +74,7 @@
 			dc_breakpoint();	\
 	} while (0)
 
-#define ASSERT(expr) do {			\
+#define ASSERT_WARN(expr) do {			\
 		if (WARN_ON_ONCE(!(expr)))	\
 			dc_breakpoint();	\
 	} while (0)
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dce100/dce100_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dce100/dce100_resource.c
index e698543ec937..5575bfdb7d31 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dce100/dce100_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dce100/dce100_resource.c
@@ -435,7 +435,7 @@ static int map_transmitter_id_to_phy_instance(
 	case TRANSMITTER_UNIPHY_G:
 		return 6;
 	default:
-		ASSERT(0);
+		ASSERT_WARN(0);
 		return 0;
 	}
 }
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dce110/dce110_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dce110/dce110_resource.c
index 035c6cfdaee5..97a21acd5c69 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dce110/dce110_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dce110/dce110_resource.c
@@ -483,7 +483,7 @@ static int map_transmitter_id_to_phy_instance(
 	case TRANSMITTER_UNIPHY_G:
 		return 6;
 	default:
-		ASSERT(0);
+		ASSERT_WARN(0);
 		return 0;
 	}
 }
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dce112/dce112_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dce112/dce112_resource.c
index 480a50967385..75079bbdf1bc 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dce112/dce112_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dce112/dce112_resource.c
@@ -463,7 +463,7 @@ static int map_transmitter_id_to_phy_instance(
 	case TRANSMITTER_UNIPHY_G:
 		return 6;
 	default:
-		ASSERT(0);
+		ASSERT_WARN(0);
 		return 0;
 	}
 }
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dce120/dce120_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dce120/dce120_resource.c
index c63c59623433..7637eea5ce64 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dce120/dce120_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dce120/dce120_resource.c
@@ -395,7 +395,7 @@ static int map_transmitter_id_to_phy_instance(
 	case TRANSMITTER_UNIPHY_G:
 		return 6;
 	default:
-		ASSERT(0);
+		ASSERT_WARN(0);
 		return 0;
 	}
 }
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dce80/dce80_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dce80/dce80_resource.c
index 3d5113f010bb..a95df4b1aaae 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dce80/dce80_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dce80/dce80_resource.c
@@ -474,7 +474,7 @@ static int map_transmitter_id_to_phy_instance(
 	case TRANSMITTER_UNIPHY_G:
 		return 6;
 	default:
-		ASSERT(0);
+		ASSERT_WARN(0);
 		return 0;
 	}
 }
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn10/dcn10_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn10/dcn10_resource.c
index 770a380cc03d..1a716c4526f3 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn10/dcn10_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn10/dcn10_resource.c
@@ -460,7 +460,7 @@ static int map_transmitter_id_to_phy_instance(
 		return 3;
 	break;
 	default:
-		ASSERT(0);
+		ASSERT_WARN(0);
 		return 0;
 	}
 }
@@ -1086,7 +1086,7 @@ static struct pipe_ctx *dcn10_acquire_free_pipe_for_layer(
 	struct pipe_ctx *idle_pipe = resource_find_free_secondary_pipe_legacy(res_ctx, pool, head_pipe);
 
 	if (!head_pipe) {
-		ASSERT(0);
+		ASSERT_WARN(0);
 		return NULL;
 	}
 
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn20/dcn20_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn20/dcn20_resource.c
index 7a5b9aa5292c..b93ea610abbe 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn20/dcn20_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn20/dcn20_resource.c
@@ -613,7 +613,7 @@ static int map_transmitter_id_to_phy_instance(
 		return 5;
 	break;
 	default:
-		ASSERT(0);
+		ASSERT_WARN(0);
 		return 0;
 	}
 }
@@ -1330,7 +1330,7 @@ void dcn20_acquire_dsc(const struct dc *dc,
 	const struct resource_pool *pool = dc->res_pool;
 	struct display_stream_compressor *dsc_old = dc->current_state->res_ctx.pipe_ctx[pipe_idx].stream_res.dsc;
 
-	ASSERT(*dsc == NULL); /* If this ASSERT fails, dsc was not released properly */
+	ASSERT_WARN(*dsc == NULL); /* If this ASSERT_WARN fails, dsc was not released properly */
 	*dsc = NULL;
 
 	/* Always do 1-to-1 mapping when number of DSCs is same as number of pipes */
@@ -1572,7 +1572,7 @@ bool dcn20_split_stream_for_odm(
 		next_odm_pipe->stream_res.opp = next_odm_pipe->top_pipe->stream_res.opp;
 	if (next_odm_pipe->stream->timing.flags.DSC == 1 && !next_odm_pipe->top_pipe) {
 		dcn20_acquire_dsc(dc, res_ctx, &next_odm_pipe->stream_res.dsc, next_odm_pipe->pipe_idx);
-		ASSERT(next_odm_pipe->stream_res.dsc);
+		ASSERT_WARN(next_odm_pipe->stream_res.dsc);
 		if (next_odm_pipe->stream_res.dsc == NULL)
 			return false;
 	}
@@ -1601,14 +1601,14 @@ void dcn20_split_stream_for_mpc(
 	secondary_pipe->plane_res.mpcc_inst = pool->dpps[secondary_pipe->pipe_idx]->inst;
 	secondary_pipe->stream_res.dsc = NULL;
 	if (primary_pipe->bottom_pipe && primary_pipe->bottom_pipe != secondary_pipe) {
-		ASSERT(!secondary_pipe->bottom_pipe);
+		ASSERT_WARN(!secondary_pipe->bottom_pipe);
 		secondary_pipe->bottom_pipe = primary_pipe->bottom_pipe;
 		secondary_pipe->bottom_pipe->top_pipe = secondary_pipe;
 	}
 	primary_pipe->bottom_pipe = secondary_pipe;
 	secondary_pipe->top_pipe = primary_pipe;
 
-	ASSERT(primary_pipe->plane_state);
+	ASSERT_WARN(primary_pipe->plane_state);
 }
 
 unsigned int dcn20_calc_max_scaled_time(
@@ -1782,7 +1782,7 @@ struct pipe_ctx *dcn20_find_secondary_pipe(struct dc *dc,
 		 * We should never hit this assert unless assignments are shuffled around
 		 * if this happens we will prob. hit a vsync tdr
 		 */
-		ASSERT(secondary_pipe);
+		ASSERT_WARN(secondary_pipe);
 		/*
 		 * search backwards for the second pipe to keep pipe
 		 * assignment more consistent
@@ -2015,7 +2015,7 @@ int dcn20_validate_apply_pipe_split_flags(
 				else if (split[i] == 2)
 					split[i] = 0; /* 2 -> 2 ODM */
 				else if (pipe->prev_odm_pipe) {
-					ASSERT(0); /* NOT expected yet */
+					ASSERT_WARN(0); /* NOT expected yet */
 					merge[i] = true; /* exit ODM */
 				}
 			} else if (resource_get_odm_slice_count(pipe) == 4) {
@@ -2024,13 +2024,13 @@ int dcn20_validate_apply_pipe_split_flags(
 						|| !pipe->next_odm_pipe)) {
 					merge[i] = true; /* 4 -> 2 ODM */
 				} else if (split[i] == 0 && pipe->prev_odm_pipe) {
-					ASSERT(0); /* NOT expected yet */
+					ASSERT_WARN(0); /* NOT expected yet */
 					merge[i] = true; /* exit ODM */
 				}
 				split[i] = 0;
 			} else if (resource_get_mpc_slice_count(pipe) > 1) {
 				/* MPC -> ODM transition */
-				ASSERT(0); /* NOT expected yet */
+				ASSERT_WARN(0); /* NOT expected yet */
 				if (pipe->top_pipe && pipe->top_pipe->plane_state == pipe->plane_state) {
 					split[i] = 0;
 					merge[i] = true;
@@ -2064,7 +2064,7 @@ bool dcn20_fast_validate_bw(
 	bool merge[MAX_PIPES] = { false };
 	int pipe_cnt, i, pipe_idx, vlevel;
 
-	ASSERT(pipes);
+	ASSERT_WARN(pipes);
 	if (!pipes)
 		return false;
 
@@ -2103,7 +2103,7 @@ bool dcn20_fast_validate_bw(
 
 		if (!pipe->top_pipe && !pipe->plane_state && context->bw_ctx.dml.vba.ODMCombineEnabled[pipe_idx]) {
 			hsplit_pipe = dcn20_find_secondary_pipe(dc, &context->res_ctx, dc->res_pool, pipe);
-			ASSERT(hsplit_pipe);
+			ASSERT_WARN(hsplit_pipe);
 			if (!dcn20_split_stream_for_odm(
 					dc, &context->res_ctx,
 					pipe, hsplit_pipe))
@@ -2127,7 +2127,7 @@ bool dcn20_fast_validate_bw(
 			if (!hsplit_pipe || hsplit_pipe->plane_state != pipe->plane_state) {
 				/* pipe not split previously needs split */
 				hsplit_pipe = dcn20_find_secondary_pipe(dc, &context->res_ctx, dc->res_pool, pipe);
-				ASSERT(hsplit_pipe);
+				ASSERT_WARN(hsplit_pipe);
 				if (!hsplit_pipe) {
 					DC_FP_START();
 					dcn20_fpu_adjust_dppclk(&context->bw_ctx.dml.vba, vlevel, context->bw_ctx.dml.vba.maxMpcComb, pipe_idx, true);
@@ -2151,7 +2151,7 @@ bool dcn20_fast_validate_bw(
 			}
 		} else if (hsplit_pipe && hsplit_pipe->plane_state == pipe->plane_state) {
 			/* merge should already have been done */
-			ASSERT(0);
+			ASSERT_WARN(0);
 		}
 	}
 
@@ -2202,7 +2202,7 @@ struct pipe_ctx *dcn20_acquire_free_pipe_for_layer(
 	struct pipe_ctx *otg_master = resource_get_otg_master_for_stream(res_ctx, opp_head->stream);
 	struct pipe_ctx *sec_dpp_pipe = resource_find_free_secondary_pipe_legacy(res_ctx, pool, otg_master);
 
-	ASSERT(otg_master);
+	ASSERT_WARN(otg_master);
 
 	if (!sec_dpp_pipe)
 		return NULL;
@@ -2311,7 +2311,7 @@ bool dcn20_mmhubbub_create(struct dc_context *ctx, struct resource_pool *pool)
 	int i;
 	uint32_t pipe_count = pool->res_cap->num_dwb;
 
-	ASSERT(pipe_count > 0);
+	ASSERT_WARN(pipe_count > 0);
 
 	for (i = 0; i < pipe_count; i++) {
 		struct dcn20_mmhubbub *mcif_wb20 = kzalloc(sizeof(struct dcn20_mmhubbub),
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn201/dcn201_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn201/dcn201_resource.c
index d3d67d366523..e8cb6ba6bdce 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn201/dcn201_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn201/dcn201_resource.c
@@ -1007,7 +1007,7 @@ static struct pipe_ctx *dcn201_acquire_free_pipe_for_layer(
 	struct pipe_ctx *idle_pipe = resource_find_free_secondary_pipe_legacy(res_ctx, pool, head_pipe);
 
 	if (!head_pipe) {
-		ASSERT(0);
+		ASSERT_WARN(0);
 		return NULL;
 	}
 
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn21/dcn21_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn21/dcn21_resource.c
index 021ba8ac5c8c..3347fca58e41 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn21/dcn21_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn21/dcn21_resource.c
@@ -776,7 +776,7 @@ bool dcn21_fast_validate_bw(struct dc *dc,
 	bool merge[MAX_PIPES] = { false };
 	int pipe_cnt, i, pipe_idx, vlevel;
 
-	ASSERT(pipes);
+	ASSERT_WARN(pipes);
 	if (!pipes)
 		return false;
 
@@ -832,7 +832,7 @@ bool dcn21_fast_validate_bw(struct dc *dc,
 				&& memcmp(&mpo_pipe->plane_state->clip_rect,
 						&pipe->stream->src,
 						sizeof(struct rect)) != 0) {
-			ASSERT(mpo_pipe->plane_state != pipe->plane_state);
+			ASSERT_WARN(mpo_pipe->plane_state != pipe->plane_state);
 			goto validate_fail;
 		}
 		pipe_idx++;
@@ -853,7 +853,7 @@ bool dcn21_fast_validate_bw(struct dc *dc,
 
 		if (!pipe->top_pipe && !pipe->plane_state && context->bw_ctx.dml.vba.ODMCombineEnabled[pipe_idx]) {
 			hsplit_pipe = dcn20_find_secondary_pipe(dc, &context->res_ctx, dc->res_pool, pipe);
-			ASSERT(hsplit_pipe);
+			ASSERT_WARN(hsplit_pipe);
 			if (!dcn20_split_stream_for_odm(
 					dc, &context->res_ctx,
 					pipe, hsplit_pipe))
@@ -872,7 +872,7 @@ bool dcn21_fast_validate_bw(struct dc *dc,
 			if (!hsplit_pipe || hsplit_pipe->plane_state != pipe->plane_state) {
 				/* pipe not split previously needs split */
 				hsplit_pipe = dcn20_find_secondary_pipe(dc, &context->res_ctx, dc->res_pool, pipe);
-				ASSERT(hsplit_pipe);
+				ASSERT_WARN(hsplit_pipe);
 				if (!hsplit_pipe) {
 					DC_FP_START();
 					dcn20_fpu_adjust_dppclk(&context->bw_ctx.dml.vba, vlevel, context->bw_ctx.dml.vba.maxMpcComb, pipe_idx, true);
@@ -896,7 +896,7 @@ bool dcn21_fast_validate_bw(struct dc *dc,
 			}
 		} else if (hsplit_pipe && hsplit_pipe->plane_state == pipe->plane_state) {
 			/* merge should already have been done */
-			ASSERT(0);
+			ASSERT_WARN(0);
 		}
 	}
 	/* Actual dsc count per stream dsc validation*/
@@ -1284,7 +1284,7 @@ static int map_transmitter_id_to_phy_instance(
 		return 4;
 	break;
 	default:
-		ASSERT(0);
+		ASSERT_WARN(0);
 		return 0;
 	}
 }
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn30/dcn30_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn30/dcn30_resource.c
index bfd0eccbed28..84820e5c7fd5 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn30/dcn30_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn30/dcn30_resource.c
@@ -1436,7 +1436,7 @@ bool dcn30_acquire_post_bldn_3dlut(
 	bool ret = false;
 	union dc_3dlut_state *state;
 
-	ASSERT(*lut == NULL && *shaper == NULL);
+	ASSERT_WARN(*lut == NULL && *shaper == NULL);
 	*lut = NULL;
 	*shaper = NULL;
 
@@ -1539,7 +1539,7 @@ static bool dcn30_split_stream_for_mpc_or_odm(
 	sec_pipe->stream_res.dsc = NULL;
 	if (odm) {
 		if (pri_pipe->next_odm_pipe) {
-			ASSERT(pri_pipe->next_odm_pipe != sec_pipe);
+			ASSERT_WARN(pri_pipe->next_odm_pipe != sec_pipe);
 			sec_pipe->next_odm_pipe = pri_pipe->next_odm_pipe;
 			sec_pipe->next_odm_pipe->prev_odm_pipe = sec_pipe;
 		}
@@ -1560,20 +1560,20 @@ static bool dcn30_split_stream_for_mpc_or_odm(
 			sec_pipe->stream_res.opp = sec_pipe->top_pipe->stream_res.opp;
 		if (sec_pipe->stream->timing.flags.DSC == 1) {
 			dcn20_acquire_dsc(dc, res_ctx, &sec_pipe->stream_res.dsc, pipe_idx);
-			ASSERT(sec_pipe->stream_res.dsc);
+			ASSERT_WARN(sec_pipe->stream_res.dsc);
 			if (sec_pipe->stream_res.dsc == NULL)
 				return false;
 		}
 	} else {
 		if (pri_pipe->bottom_pipe) {
-			ASSERT(pri_pipe->bottom_pipe != sec_pipe);
+			ASSERT_WARN(pri_pipe->bottom_pipe != sec_pipe);
 			sec_pipe->bottom_pipe = pri_pipe->bottom_pipe;
 			sec_pipe->bottom_pipe->top_pipe = sec_pipe;
 		}
 		pri_pipe->bottom_pipe = sec_pipe;
 		sec_pipe->top_pipe = pri_pipe;
 
-		ASSERT(pri_pipe->plane_state);
+		ASSERT_WARN(pri_pipe->plane_state);
 	}
 
 	return true;
@@ -1607,7 +1607,7 @@ static struct pipe_ctx *dcn30_find_split_pipe(
 	/*
 	 * May need to fix pipes getting tossed from 1 opp to another on flip
 	 * Add for debugging transient underflow during topology updates:
-	 * ASSERT(pipe);
+	 * ASSERT_WARN(pipe);
 	 */
 	if (!pipe)
 		for (i = dc->res_pool->pipe_count - 1; i >= 0; i--) {
@@ -1638,7 +1638,7 @@ noinline bool dcn30_internal_validate_bw(
 	int pipe_cnt, i, pipe_idx, vlevel = 0;
 	struct vba_vars_st *vba = &context->bw_ctx.dml.vba;
 
-	ASSERT(pipes);
+	ASSERT_WARN(pipes);
 	if (!pipes)
 		return false;
 
@@ -1710,7 +1710,7 @@ noinline bool dcn30_internal_validate_bw(
 					&& memcmp(&mpo_pipe->plane_state->clip_rect,
 							&pipe->stream->src,
 							sizeof(struct rect)) != 0) {
-				ASSERT(mpo_pipe->plane_state != pipe->plane_state);
+				ASSERT_WARN(mpo_pipe->plane_state != pipe->plane_state);
 				goto validate_fail;
 			}
 			pipe_idx++;
@@ -1759,7 +1759,7 @@ noinline bool dcn30_internal_validate_bw(
 			memset(&pipe->stream_res, 0, sizeof(pipe->stream_res));
 			repopulate_pipes = true;
 		} else
-			ASSERT(0); /* Should never try to merge master pipe */
+			ASSERT_WARN(0); /* Should never try to merge master pipe */
 
 	}
 
@@ -1794,7 +1794,7 @@ noinline bool dcn30_internal_validate_bw(
 					old_index = old_pipe->bottom_pipe->pipe_idx;
 			}
 			hsplit_pipe = dcn30_find_split_pipe(dc, context, old_index);
-			ASSERT(hsplit_pipe);
+			ASSERT_WARN(hsplit_pipe);
 			if (!hsplit_pipe)
 				goto validate_fail;
 
@@ -1817,7 +1817,7 @@ noinline bool dcn30_internal_validate_bw(
 			else
 				old_index = -1;
 			pipe_4to1 = dcn30_find_split_pipe(dc, context, old_index);
-			ASSERT(pipe_4to1);
+			ASSERT_WARN(pipe_4to1);
 			if (!pipe_4to1)
 				goto validate_fail;
 			if (!dcn30_split_stream_for_mpc_or_odm(
@@ -1836,7 +1836,7 @@ noinline bool dcn30_internal_validate_bw(
 			else
 				old_index = -1;
 			pipe_4to1 = dcn30_find_split_pipe(dc, context, old_index);
-			ASSERT(pipe_4to1);
+			ASSERT_WARN(pipe_4to1);
 			if (!pipe_4to1)
 				goto validate_fail;
 			if (!dcn30_split_stream_for_mpc_or_odm(
@@ -2011,7 +2011,7 @@ bool dcn30_can_support_mclk_switch_using_fw_based_vblank_stretch(struct dc *dc,
  */
 void dcn30_setup_mclk_switch_using_fw_based_vblank_stretch(struct dc *dc, struct dc_state *context)
 {
-	ASSERT(dc != NULL && context != NULL);
+	ASSERT_WARN(dc != NULL && context != NULL);
 	if (dc == NULL || context == NULL)
 		return;
 
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c
index 54ec3d8e920c..ea5aadbcdfb7 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn31/dcn31_resource.c
@@ -1262,7 +1262,7 @@ static struct hpo_dp_stream_encoder *dcn31_hpo_dp_stream_encoder_create(
 	uint32_t vpg_inst;
 	uint32_t apg_inst;
 
-	ASSERT((eng_id >= ENGINE_ID_HPO_DP_0) && (eng_id <= ENGINE_ID_HPO_DP_3));
+	ASSERT_WARN((eng_id >= ENGINE_ID_HPO_DP_0) && (eng_id <= ENGINE_ID_HPO_DP_3));
 	hpo_dp_inst = eng_id - ENGINE_ID_HPO_DP_0;
 
 	/* Mapping of VPG register blocks to HPO DP block instance:
@@ -1692,7 +1692,7 @@ int dcn31_populate_dml_pipes_from_context(
 				pipes[pipe_cnt].dout.dsc_input_bpc = 12;
 				break;
 			default:
-				ASSERT(0);
+				ASSERT_WARN(0);
 				break;
 			}
 		}
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c
index 2794473f2aff..1d50bb0b837d 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn314/dcn314_resource.c
@@ -1318,7 +1318,7 @@ static struct hpo_dp_stream_encoder *dcn31_hpo_dp_stream_encoder_create(
 	uint32_t vpg_inst;
 	uint32_t apg_inst;
 
-	ASSERT((eng_id >= ENGINE_ID_HPO_DP_0) && (eng_id <= ENGINE_ID_HPO_DP_3));
+	ASSERT_WARN((eng_id >= ENGINE_ID_HPO_DP_0) && (eng_id <= ENGINE_ID_HPO_DP_3));
 	hpo_dp_inst = eng_id - ENGINE_ID_HPO_DP_0;
 
 	/* Mapping of VPG register blocks to HPO DP block instance:
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn315/dcn315_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn315/dcn315_resource.c
index 4ee33eb3381d..2a1fa8693fe7 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn315/dcn315_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn315/dcn315_resource.c
@@ -1262,7 +1262,7 @@ static struct hpo_dp_stream_encoder *dcn31_hpo_dp_stream_encoder_create(
 	uint32_t vpg_inst;
 	uint32_t apg_inst;
 
-	ASSERT((eng_id >= ENGINE_ID_HPO_DP_0) && (eng_id <= ENGINE_ID_HPO_DP_3));
+	ASSERT_WARN((eng_id >= ENGINE_ID_HPO_DP_0) && (eng_id <= ENGINE_ID_HPO_DP_3));
 	hpo_dp_inst = eng_id - ENGINE_ID_HPO_DP_0;
 
 	/* Mapping of VPG register blocks to HPO DP block instance:
@@ -1734,7 +1734,7 @@ static int dcn315_populate_dml_pipes_from_context(
 				pipes[pipe_cnt].dout.dsc_input_bpc = 12;
 				break;
 			default:
-				ASSERT(0);
+				ASSERT_WARN(0);
 				break;
 			}
 		}
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn316/dcn316_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn316/dcn316_resource.c
index 79eddbafe3c2..25f86802dbc6 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn316/dcn316_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn316/dcn316_resource.c
@@ -1257,7 +1257,7 @@ static struct hpo_dp_stream_encoder *dcn31_hpo_dp_stream_encoder_create(
 	uint32_t vpg_inst;
 	uint32_t apg_inst;
 
-	ASSERT((eng_id >= ENGINE_ID_HPO_DP_0) && (eng_id <= ENGINE_ID_HPO_DP_3));
+	ASSERT_WARN((eng_id >= ENGINE_ID_HPO_DP_0) && (eng_id <= ENGINE_ID_HPO_DP_3));
 	hpo_dp_inst = eng_id - ENGINE_ID_HPO_DP_0;
 
 	/* Mapping of VPG register blocks to HPO DP block instance:
@@ -1656,7 +1656,7 @@ static int dcn316_populate_dml_pipes_from_context(
 				pipes[pipe_cnt].dout.dsc_input_bpc = 12;
 				break;
 			default:
-				ASSERT(0);
+				ASSERT_WARN(0);
 				break;
 			}
 		}
@@ -1669,7 +1669,7 @@ static int dcn316_populate_dml_pipes_from_context(
 				(max_usable_det / DCN3_16_CRB_SEGMENT_SIZE_KB / pipe_cnt) * DCN3_16_CRB_SEGMENT_SIZE_KB;
 	if (context->bw_ctx.dml.ip.det_buffer_size_kbytes > DCN3_16_MAX_DET_SIZE)
 		context->bw_ctx.dml.ip.det_buffer_size_kbytes = DCN3_16_MAX_DET_SIZE;
-	ASSERT(context->bw_ctx.dml.ip.det_buffer_size_kbytes >= DCN3_16_DEFAULT_DET_SIZE);
+	ASSERT_WARN(context->bw_ctx.dml.ip.det_buffer_size_kbytes >= DCN3_16_DEFAULT_DET_SIZE);
 	dc->config.enable_4to1MPC = false;
 	if (pipe_cnt == 1 && pipe->plane_state && !dc->debug.disable_z9_mpc) {
 		if (is_dual_plane(pipe->plane_state->format)
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
index 12d247a7ec45..85dd45fde7b4 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
@@ -1250,7 +1250,7 @@ static struct hpo_dp_stream_encoder *dcn32_hpo_dp_stream_encoder_create(
 	uint32_t vpg_inst;
 	uint32_t apg_inst;
 
-	ASSERT((eng_id >= ENGINE_ID_HPO_DP_0) && (eng_id <= ENGINE_ID_HPO_DP_3));
+	ASSERT_WARN((eng_id >= ENGINE_ID_HPO_DP_0) && (eng_id <= ENGINE_ID_HPO_DP_3));
 	hpo_dp_inst = eng_id - ENGINE_ID_HPO_DP_0;
 
 	/* Mapping of VPG register blocks to HPO DP block instance:
@@ -1600,7 +1600,7 @@ bool dcn32_acquire_post_bldn_3dlut(
 {
 	bool ret = false;
 
-	ASSERT(*lut == NULL && *shaper == NULL);
+	ASSERT_WARN(*lut == NULL && *shaper == NULL);
 	*lut = NULL;
 	*shaper = NULL;
 
@@ -1893,7 +1893,7 @@ int dcn32_populate_dml_pipes_from_context(
 			if (single_display_subvp && (mall_type == SUBVP_PHANTOM)) {
 				if (subvp_main_pipe_index < 0) {
 					odm_slice_count = -1;
-					ASSERT(0);
+					ASSERT_WARN(0);
 				} else {
 					odm_slice_count = resource_get_odm_slice_count(&res_ctx->pipe_ctx[subvp_main_pipe_index]);
 				}
@@ -1955,7 +1955,7 @@ int dcn32_populate_dml_pipes_from_context(
 				pipes[pipe_cnt].dout.dsc_input_bpc = 12;
 				break;
 			default:
-				ASSERT(0);
+				ASSERT_WARN(0);
 				break;
 			}
 		}
@@ -2126,10 +2126,10 @@ static bool dcn32_resource_construct(
 			num_pipes--;
 
 	if (pipe_fuses & 1)
-		ASSERT(0); //Unexpected - Pipe 0 should always be fully functional!
+		ASSERT_WARN(0); //Unexpected - Pipe 0 should always be fully functional!
 
 	if (pipe_fuses & CC_DC_PIPE_DIS__DC_FULL_DIS_MASK)
-		ASSERT(0); //Entire DCN is harvested!
+		ASSERT_WARN(0); //Entire DCN is harvested!
 
 	/* within dml lib, initial value is hard coded, if ASIC pipe is fused, the
 	 * value will be changed, update max_num_dpp and max_num_otg for dml.
@@ -2683,7 +2683,7 @@ static struct pipe_ctx *dcn32_acquire_idle_pipe_for_head_pipe_in_layer(
 	int head_index;
 
 	if (!head_pipe) {
-		ASSERT(0);
+		ASSERT_WARN(0);
 		return NULL;
 	}
 
@@ -2773,7 +2773,7 @@ struct pipe_ctx *dcn32_acquire_free_pipe_as_secondary_dpp_pipe(
 		free_pipe->plane_res.mpcc_inst =
 				pool->dpps[free_pipe->pipe_idx]->inst;
 	} else {
-		ASSERT(opp_head_pipe);
+		ASSERT_WARN(opp_head_pipe);
 		free_pipe = NULL;
 	}
 
@@ -2810,14 +2810,14 @@ struct pipe_ctx *dcn32_acquire_free_pipe_as_secondary_opp_head(
 					&new_ctx->res_ctx,
 					&free_pipe->stream_res.dsc,
 					free_pipe_idx);
-			ASSERT(free_pipe->stream_res.dsc);
+			ASSERT_WARN(free_pipe->stream_res.dsc);
 			if (free_pipe->stream_res.dsc == NULL) {
 				memset(free_pipe, 0, sizeof(*free_pipe));
 				free_pipe = NULL;
 			}
 		}
 	} else {
-		ASSERT(otg_master);
+		ASSERT_WARN(otg_master);
 		free_pipe = NULL;
 	}
 
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c
index 06b9479c8bd3..82e82c34d2da 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c
@@ -1233,7 +1233,7 @@ static struct hpo_dp_stream_encoder *dcn321_hpo_dp_stream_encoder_create(
 	uint32_t vpg_inst;
 	uint32_t apg_inst;
 
-	ASSERT((eng_id >= ENGINE_ID_HPO_DP_0) && (eng_id <= ENGINE_ID_HPO_DP_3));
+	ASSERT_WARN((eng_id >= ENGINE_ID_HPO_DP_0) && (eng_id <= ENGINE_ID_HPO_DP_3));
 	hpo_dp_inst = eng_id - ENGINE_ID_HPO_DP_0;
 
 	/* Mapping of VPG register blocks to HPO DP block instance:
@@ -1683,10 +1683,10 @@ static bool dcn321_resource_construct(
 			num_pipes--;
 
 	if (pipe_fuses & 1)
-		ASSERT(0); //Unexpected - Pipe 0 should always be fully functional!
+		ASSERT_WARN(0); //Unexpected - Pipe 0 should always be fully functional!
 
 	if (pipe_fuses & CC_DC_PIPE_DIS__DC_FULL_DIS_MASK)
-		ASSERT(0); //Entire DCN is harvested!
+		ASSERT_WARN(0); //Entire DCN is harvested!
 
 	/* within dml lib, initial value is hard coded, if ASIC pipe is fused, the
 	 * value will be changed, update max_num_dpp and max_num_otg for dml.
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
index 89e2adcf2a28..39199171bd75 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
@@ -1315,7 +1315,7 @@ static struct hpo_dp_stream_encoder *dcn31_hpo_dp_stream_encoder_create(
 	uint32_t vpg_inst;
 	uint32_t apg_inst;
 
-	ASSERT((eng_id >= ENGINE_ID_HPO_DP_0) && (eng_id <= ENGINE_ID_HPO_DP_3));
+	ASSERT_WARN((eng_id >= ENGINE_ID_HPO_DP_0) && (eng_id <= ENGINE_ID_HPO_DP_3));
 	hpo_dp_inst = eng_id - ENGINE_ID_HPO_DP_0;
 
 	/* Mapping of VPG register blocks to HPO DP block instance:
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
index 263a37c1cd3a..b9edfe36b644 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
@@ -1295,7 +1295,7 @@ static struct hpo_dp_stream_encoder *dcn31_hpo_dp_stream_encoder_create(
 	uint32_t vpg_inst;
 	uint32_t apg_inst;
 
-	ASSERT((eng_id >= ENGINE_ID_HPO_DP_0) && (eng_id <= ENGINE_ID_HPO_DP_3));
+	ASSERT_WARN((eng_id >= ENGINE_ID_HPO_DP_0) && (eng_id <= ENGINE_ID_HPO_DP_3));
 	hpo_dp_inst = eng_id - ENGINE_ID_HPO_DP_0;
 
 	/* Mapping of VPG register blocks to HPO DP block instance:
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
index 2a3dabfe3cea..0d73b8cd8af6 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
@@ -1222,7 +1222,7 @@ static struct hpo_dp_stream_encoder *dcn401_hpo_dp_stream_encoder_create(
 	uint32_t vpg_inst;
 	uint32_t apg_inst;
 
-	ASSERT((eng_id >= ENGINE_ID_HPO_DP_0) && (eng_id <= ENGINE_ID_HPO_DP_3));
+	ASSERT_WARN((eng_id >= ENGINE_ID_HPO_DP_0) && (eng_id <= ENGINE_ID_HPO_DP_3));
 	hpo_dp_inst = eng_id - ENGINE_ID_HPO_DP_0;
 
 	/* Mapping of VPG register blocks to HPO DP block instance:
@@ -1812,10 +1812,10 @@ static bool dcn401_resource_construct(
 			num_pipes--;
 
 	if (pipe_fuses & 1)
-		ASSERT(0); //Unexpected - Pipe 0 should always be fully functional!
+		ASSERT_WARN(0); //Unexpected - Pipe 0 should always be fully functional!
 
 	if (pipe_fuses & CC_DC_PIPE_DIS__DC_FULL_DIS_MASK)
-		ASSERT(0); //Entire DCN is harvested!
+		ASSERT_WARN(0); //Entire DCN is harvested!
 
 	pool->base.funcs = &dcn401_res_pool_funcs;
 
diff --git a/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c b/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c
index a3f3ff5d49ac..60565bb2d984 100644
--- a/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c
+++ b/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c
@@ -633,7 +633,7 @@ enum dmub_status dmub_srv_hw_init(struct dmub_srv *dmub,
 
 	if (!inst_fb || !stack_fb || !data_fb || !bios_fb || !mail_fb ||
 		!tracebuff_fb || !fw_state_fb || !scratch_mem_fb) {
-		ASSERT(0);
+		ASSERT_WARN(0);
 		return DMUB_STATUS_INVALID;
 	}
 
@@ -1191,7 +1191,7 @@ enum dmub_status dmub_srv_send_reg_inbox0_cmd(
 			break;
 		udelay(1);
 	}
-	ASSERT(rsp_ready == 0);
+	ASSERT_WARN(rsp_ready == 0);
 
 	return DMUB_STATUS_OK;
 }
diff --git a/drivers/gpu/drm/amd/display/include/fixed31_32.h b/drivers/gpu/drm/amd/display/include/fixed31_32.h
index 990fa1f19c22..f18ca67157b7 100644
--- a/drivers/gpu/drm/amd/display/include/fixed31_32.h
+++ b/drivers/gpu/drm/amd/display/include/fixed31_32.h
@@ -209,7 +209,7 @@ static inline struct fixed31_32 dc_fixpt_clamp(
  */
 static inline struct fixed31_32 dc_fixpt_shl(struct fixed31_32 arg, unsigned char shift)
 {
-	ASSERT(((arg.value >= 0) && (arg.value <= LLONG_MAX >> shift)) ||
+	ASSERT_WARN(((arg.value >= 0) && (arg.value <= LLONG_MAX >> shift)) ||
 		((arg.value < 0) && (arg.value >= ~(LLONG_MAX >> shift))));
 
 	arg.value = arg.value << shift;
@@ -246,7 +246,7 @@ static inline struct fixed31_32 dc_fixpt_add(struct fixed31_32 arg1, struct fixe
 {
 	struct fixed31_32 res;
 
-	ASSERT(((arg1.value >= 0) && (LLONG_MAX - arg1.value >= arg2.value)) ||
+	ASSERT_WARN(((arg1.value >= 0) && (LLONG_MAX - arg1.value >= arg2.value)) ||
 		((arg1.value < 0) && (LLONG_MIN - arg1.value <= arg2.value)));
 
 	res.value = arg1.value + arg2.value;
@@ -271,7 +271,7 @@ static inline struct fixed31_32 dc_fixpt_sub(struct fixed31_32 arg1, struct fixe
 {
 	struct fixed31_32 res;
 
-	ASSERT(((arg2.value >= 0) && (LLONG_MIN + arg2.value <= arg1.value)) ||
+	ASSERT_WARN(((arg2.value >= 0) && (LLONG_MIN + arg2.value <= arg1.value)) ||
 		((arg2.value < 0) && (LLONG_MAX + arg2.value >= arg1.value)));
 
 	res.value = arg1.value - arg2.value;
@@ -463,7 +463,7 @@ static inline int dc_fixpt_round(struct fixed31_32 arg)
 
 	const long long summand = dc_fixpt_half.value;
 
-	ASSERT(LLONG_MAX - (long long)arg_value >= summand);
+	ASSERT_WARN(LLONG_MAX - (long long)arg_value >= summand);
 
 	arg_value += summand;
 
@@ -484,7 +484,7 @@ static inline int dc_fixpt_ceil(struct fixed31_32 arg)
 	const long long summand = dc_fixpt_one.value -
 		dc_fixpt_epsilon.value;
 
-	ASSERT(LLONG_MAX - (long long)arg_value >= summand);
+	ASSERT_WARN(LLONG_MAX - (long long)arg_value >= summand);
 
 	arg_value += summand;
 
@@ -519,7 +519,7 @@ static inline struct fixed31_32 dc_fixpt_truncate(struct fixed31_32 arg, unsigne
 	bool negative = arg.value < 0;
 
 	if (frac_bits >= FIXED31_32_BITS_PER_FRACTIONAL_PART) {
-		ASSERT(frac_bits == FIXED31_32_BITS_PER_FRACTIONAL_PART);
+		ASSERT_WARN(frac_bits == FIXED31_32_BITS_PER_FRACTIONAL_PART);
 		return arg;
 	}
 
diff --git a/drivers/gpu/drm/amd/display/modules/color/color_gamma.c b/drivers/gpu/drm/amd/display/modules/color/color_gamma.c
index a71df052cf25..e8eb593e517d 100644
--- a/drivers/gpu/drm/amd/display/modules/color/color_gamma.c
+++ b/drivers/gpu/drm/amd/display/modules/color/color_gamma.c
@@ -1504,7 +1504,7 @@ static void build_evenly_distributed_points(
 	uint32_t i = 0;
 
 	// This function should not gets called with 0 as a parameter
-	ASSERT(numberof_points > 0);
+	ASSERT_WARN(numberof_points > 0);
 	p_last = p + numberof_points - 1;
 
 	do {
diff --git a/drivers/gpu/drm/amd/display/modules/freesync/freesync.c b/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
index 2b3964529539..d52bc91e014e 100644
--- a/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
+++ b/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
@@ -163,7 +163,7 @@ unsigned int mod_freesync_calc_v_total_from_refresh(
 
 	/* v_total cannot be less than nominal */
 	if (v_total < stream->timing.v_total) {
-		ASSERT(v_total < stream->timing.v_total);
+		ASSERT_WARN(v_total < stream->timing.v_total);
 		v_total = stream->timing.v_total;
 	}
 
@@ -198,7 +198,7 @@ static unsigned int calc_v_total_from_duration(
 
 	/* v_total cannot be less than nominal */
 	if (v_total < stream->timing.v_total) {
-		ASSERT(v_total < stream->timing.v_total);
+		ASSERT_WARN(v_total < stream->timing.v_total);
 		v_total = stream->timing.v_total;
 	}
 
diff --git a/drivers/gpu/drm/amd/display/modules/power/power_helpers.c b/drivers/gpu/drm/amd/display/modules/power/power_helpers.c
index 95838c7ab054..485be1331d74 100644
--- a/drivers/gpu/drm/amd/display/modules/power/power_helpers.c
+++ b/drivers/gpu/drm/amd/display/modules/power/power_helpers.c
@@ -265,7 +265,7 @@ static void fill_backlight_transform_table(struct dmcu_iram_parameters params,
 	 */
 	for (i = 1; i+1 < num_entries; i++) {
 		lut_index = (params.backlight_lut_array_size - 1) * i / (num_entries - 1);
-		ASSERT(lut_index < params.backlight_lut_array_size);
+		ASSERT_WARN(lut_index < params.backlight_lut_array_size);
 
 		table->backlight_thresholds[i] =
 			cpu_to_be16(DIV_ROUNDUP((i * 65536), num_entries));
@@ -297,7 +297,7 @@ static void fill_backlight_transform_table_v_2_2(struct dmcu_iram_parameters par
 	 */
 	for (i = 1; i+1 < num_entries; i++) {
 		lut_index = DIV_ROUNDUP((i * params.backlight_lut_array_size), num_entries);
-		ASSERT(lut_index < params.backlight_lut_array_size);
+		ASSERT_WARN(lut_index < params.backlight_lut_array_size);
 
 		table->backlight_thresholds[i] = (big_endian) ?
 			cpu_to_be16(DIV_ROUNDUP((i * 65536), num_entries)) :
@@ -967,7 +967,7 @@ bool psr_su_set_dsc_slice_height(struct dc *dc, struct dc_link *link,
 	if (slice_height) {
 		if (config->su_y_granularity &&
 		    (slice_height % config->su_y_granularity)) {
-			ASSERT(0);
+			ASSERT_WARN(0);
 			return false;
 		}
 	}
@@ -1013,7 +1013,7 @@ void calculate_replay_link_off_frame_count(struct dc_link *link,
 	if (htotal != 0 && vtotal != 0 && pixel_deviation_per_line != 0)
 		max_link_off_frame_count = htotal * max_deviation_line / (pixel_deviation_per_line * vtotal);
 	else
-		ASSERT(0);
+		ASSERT_WARN(0);
 
 	link->replay_settings.link_off_frame_count = max_link_off_frame_count;
 }
diff --git a/drivers/gpu/drm/amd/display/modules/vmid/vmid.c b/drivers/gpu/drm/amd/display/modules/vmid/vmid.c
index 2c40212d86da..d916756c6eb3 100644
--- a/drivers/gpu/drm/amd/display/modules/vmid/vmid.c
+++ b/drivers/gpu/drm/amd/display/modules/vmid/vmid.c
@@ -117,7 +117,7 @@ uint8_t mod_vmid_get_for_ptb(struct mod_vmid *mod_vmid, uint64_t ptb)
 
 			dc_setup_vm_context(core_vmid->dc, &va_config, vmid);
 		} else
-			ASSERT(0);
+			ASSERT_WARN(0);
 	}
 
 	return vmid;
-- 
2.42.0

